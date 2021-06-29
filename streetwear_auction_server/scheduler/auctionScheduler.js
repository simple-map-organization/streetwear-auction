const cron = require("node-cron");
const Auction = require("../models/auction");
const Purchase = require("../models/purchase");

module.exports = cron.schedule("*/5 * * * *", async () => {
  await endBidScheduler();
  await endTimeScheduler();
  await payBeforeScheduler();
  await shipBeforeScheduler();
  console.log("Auction List Updated");
});

async function endTimeScheduler() {
  let auctions = await Auction.find({
    status: "ongoing",
    endTime: { $lte: new Date() },
    bids: { $exists: true, $eq: [] },
  });
  auctions.forEach(async (auction) => {
    auction.status = "Cancelled (No Bidder)";
    auction.save();
  });
}

async function payBeforeScheduler() {
  let purchases = await Purchase.find({
    won: true,
    payBefore: { $lte: new Date() },
  }).populate("product");

  purchases = purchases.filter(
    (purchase) => purchase.product.status == "Payment Pending"
  );

  purchases.forEach(async (purchase) => {
    purchase.status = "Cancelled (Fail To Pay)";
    purchase.save();
  });
}

async function shipBeforeScheduler() {
  let purchases = await Purchase.find({
    won: true,
    paidDate: { $lte: new Date().setDate(new Date().getDate() - 3) },
  }).populate("product");

  purchases = purchases.filter(
    (purchase) => purchase.product.status == "To Ship"
  );

  purchases.forEach(async (purchase) => {
    purchase.status = "Cancelled (Fail To Ship)";
    purchase.save();
  });
}

async function endBidScheduler() {
  let auctions = await Auction.find({
    status: "ongoing",
    endTime: { $lte: new Date() },
  }).populate({
    path: "bids.userId",
    select: "username",
  });
  auctions.forEach(async (auction) => {
    let purchases = auction.bids.map((bid) => {
      return {
        product: auction._id,
        user: bid.userId._id,
        won: false,
        payBefore: null,
        paidOn: null,
        delivery: {
          fullname: "",
          phone: "",
          address1: "",
          address2: "",
          postcode: "",
          state: "",
          country: "",
        },
      };
    });
    auction.status = "Payment Pending";
    auction.save();
    purchases[0].won = true;
    purchases[0].payBefore = new Date().setDate(new Date().getDate() + 7);

    await Purchase.insertMany(purchases);
  });
}
