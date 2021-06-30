const cron = require("node-cron");
const Auction = require("../models/auction");
const Purchase = require("../models/purchase");
const Notification = require("../models/notification");
const Watchlist = require("../models/watchlist");

module.exports = cron.schedule("*/10 * * * * *", async () => {
  // */5 * * * *
  await endBidScheduler();
  await endTimeScheduler();
  await payBeforeScheduler();
  await shipBeforeScheduler();
  await reminderToShipScheduler();
  await reminderToPayScheduler();
  // await reminderEndingScheduler();
  console.log("Auction List Updated");
});

async function endTimeScheduler() {
  let auctions = await Auction.find({
    status: "Ongoing",
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
    paidOn: { $lte: new Date().setDate(new Date().getDate() - 3) },
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
    status: "Ongoing",
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

    //send notification to winner
    if (auction.bids.length > 0) {
      let oldBuyerNotification = await Notification.find({
        auctionId: auction._id,
        userId: auction.bids[0].userId._id,
        type: "wonAnAuction",
      });
      if (oldBuyerNotification.length == 0) {
        let notification = new Notification();
        notification.shortProductName = auction.shortProductName;
        notification.dateTime = Date.now();
        notification.type = "wonAnAuction";
        notification.userId = auction.bids[0].userId;
        notification.auctionId = auction._id;
        notification.read = false;

        notification.save();
      }
    }

    //send notification to seller
    let oldSellerNotification = await Notification.find({
      auctionId: auction._id,
      userId: auction.seller._id,
      type: "auctionEnded",
    });
    if (oldSellerNotification.length == 0) {
      let notification = new Notification();
      notification.shortProductName = auction.shortProductName;
      notification.dateTime = Date.now();
      notification.type = "auctionEnded";
      notification.userId = auction.seller._id;
      notification.auctionId = auction._id;
      notification.read = false;

      notification.save();
    }
  });
}

async function reminderToShipScheduler() {
  let purchases = await Purchase.find({
    won: true,
    paidOn: { $lte: new Date().setDate(new Date().getDate() - 2) },
  }).populate("product");

  purchases = purchases.filter(
    (purchase) => purchase.product.status == "To Ship"
  );

  purchases.forEach(async (purchase) => {
    let oldNotification = await Notification.find({
      auctionId: purchase.product._id,
      type: "reminderToShip",
    });
    if (oldNotification.length == 0) {
      console.log("added");
      let notification = new Notification();
      notification.shortProductName = purchase.product.shortProductName;
      notification.dateTime = Date.now();
      notification.type = "reminderToShip";
      notification.userId = purchase.product.seller._id;
      notification.auctionId = purchase.product._id;
      notification.read = false;

      notification.save();
    }
  });
}

async function reminderToPayScheduler() {
  let purchases = await Purchase.find({
    won: true,
    payBefore: { $lte: new Date().setDate(new Date().getDate() - 1) },
  }).populate("product");

  purchases = purchases.filter(
    (purchase) => purchase.product.status == "Payment Pending"
  );

  purchases.forEach(async (purchase) => {
    let oldNotification = await Notification.find({
      auctionId: purchase.product._id,
      type: "reminderToPay",
    });
    if (oldNotification.length == 0) {
      console.log("added");
      let notification = new Notification();
      notification.shortProductName = purchase.product.shortProductName;
      notification.dateTime = Date.now();
      notification.type = "reminderToPay";
      notification.userId = purchase.user._id;
      notification.auctionId = purchase.product._id;
      notification.read = false;

      notification.save();
    }
  });

  //   async function reminderEndingScheduler() {
  //     let auctions = await Auction.find({
  //       status: "ongoing",
  //       endTime: { $lte: new Date().setDate(new Date().getHours - 1) },
  //     });

  //     let watchlist = await Watchlist.find({
  //       // dates: { $elemMatch: { date: { $gte: "DATE_VALUE" } } },
  //     });

  //     watchlist.forEach(async (wl) => {
  //       let oldNotification = await Notification.find({
  //         auctionId: purchase.product._id,
  //         type: "ending",
  //         userId: "1",
  //       });
  //       if (oldNotification.length == 0) {
  //         console.log("added");
  //         let notification = new Notification();
  //         notification.shortProductName = purchase.product.productShortName;
  //         notification.dateTime = Date.now();
  //         notification.type = "ending";
  //         notification.userId = purchase.user._id;
  //         notification.auctionId = purchase.product._id;
  //         notification.read = false;

  //         notification.save();
  //       }
  //     });
  //   }
}
