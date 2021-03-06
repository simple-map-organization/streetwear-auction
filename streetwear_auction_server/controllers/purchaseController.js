require("dotenv").config();
const mongoose = require("mongoose");
const Purchase = require("../models/purchase");
const Auction = require("../models/auction");
const Notification = require("../models/notification");

module.exports.getPurchaseList = async (req, res) => {
  const host = req.headers.host;
  const id = req.id;
  let purchase = await Purchase.find({ user: id }).populate({
    path: "product",
    populate: {
      path: "seller",
      select: "username",
    },
  });

  for (let index = 0; index < purchase.length; index++) {
    purchase[index].product = { ...purchase[index].product };
    for (let i = 0; i < purchase[index].product.photos.length; i++) {
      purchase[index].product.photos[i] = `http://${host}/images/${purchase[index].product.photos[i]}`;
    }
  }

  res.json(purchase);
};

module.exports.updateStatus = async (req, res) => {
  const id = req.params["id"];
  const { rating } = req.body;
  let purchase = await Purchase.findById(id).populate({
    path: "product",
    populate: {
      path: "seller",
    },
  });

  if (purchase != null) {
    switch (purchase.product.status) {
      case "Payment Pending":
        purchase.product.status = "To Ship";
        break;
      case "To Ship":
        purchase.product.status = "To Receive";
        break;
      case "To Receive":
        purchase.product.seller.totalDeal++;
        purchase.product.seller.save();
        purchase.product.status = "To Rate";
        break;
      case "To Rate":
        purchase.product.status = "Completed";
        break;
    }
    await purchase.product.save();
    if (rating) {
      let product = await Auction.findById(purchase.product._id).populate("seller");
      product.rating = rating;
      product.seller.rating = (product.seller.rating * product.seller.ratingCount + rating) / (product.seller.ratingCount + 1);
      product.seller.ratingCount++;
      await product.seller.save();
      await product.save();
    }

    res.json(purchase);
  }
};

module.exports.updatePurchase = async (req, res) => {
  const purchaseId = req.params["purchaseId"];

  const { fullname, phone, address1, address2, postcode, state } = req.body;

  let purchaseData = {
    paidOn: new Date(),
    delivery: {
      fullname: fullname,
      phone: phone,
      address1: address1,
      address2: address2,
      postcode: postcode,
      state: state,
      country: "Malaysia",
    },
  };

  let purchase = await Purchase.findByIdAndUpdate(purchaseId, purchaseData, {
    useFindAndModify: false,
    new: true,
  }).populate("product");
  purchase.product.status = "To Ship";
  purchase.product.save();
  res.json(purchase);

  //send notification to seller upon success payment
  let notification = new Notification();
  notification.shortProductName = purchase.product.shortProductName;
  notification.dateTime = Date.now();
  notification.type = "havePaid";
  notification.userId = purchase.product.seller._id;
  notification.auctionId = purchase.product._id;
  notification.read = false;

  console.log(purchase);

  notification.save();
};

module.exports.getUserPurchaseByAuctionId = async (req, res) => {
  const userId = req.id;
  const auctionId = req.params["auctionId"];
  let purchase = await Purchase.findOne({
    $and: [{ user: userId }, { product: auctionId }],
  })
    .populate({
      path: "product",
      populate: {
        path: "seller",
        select: "username",
      },
    })
    .populate({
      path: "product",
      populate: {
        path: "bids.userId",
        select: "username",
      },
    });
  res.json(purchase);
};

module.exports.getPurchaseByUserIdAndAuctionId = async (req, res) => {
  const userId = req.params["userId"];
  const auctionId = req.query.auctionId;
  let purchase = await Purchase.findOne({
    $and: [{ user: userId }, { product: auctionId }],
  })
    .populate({
      path: "product",
      populate: {
        path: "seller",
        select: "username",
      },
    })
    .populate({
      path: "product",
      populate: {
        path: "bids.userId",
        select: "username",
      },
    });
  res.json(purchase);
};
