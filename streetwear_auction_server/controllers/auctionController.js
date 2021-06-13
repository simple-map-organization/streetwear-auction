const mongoose = require("mongoose");
const Auction = require("../models/auction");
var fs = require("fs");
const { json } = require("express");

module.exports.getAuctionList = async (req, res) => {
  const productName = req.query.productName;
  const category = req.query.category;
  const status = req.query.status;
  const seller = req.query.seller;

  let filterQuery = {};
  productName &&
    (filterQuery.productName = { $regex: productName, $options: "i" });
  category && (filterQuery.category = { $regex: category, $options: "i" });
  status && (filterQuery.status = { $regex: status, $options: "i" });
  seller && (filterQuery.seller = new mongoose.Types.ObjectId(seller));

  let auctions = await Auction.find(filterQuery).populate(
    "bids.userId, seller"
  );

  res.json(auctions);
};

module.exports.getAuction = (req, res) => {
  const id = req.params["id"];
  Auction.findById(id)
    .then((result) => {
      res.send(result);
    })
    .catch((err) => {
      console.log(err);
    })
};

module.exports.getUserAuctionList = (req, res) => {
  const status = req.query.status;
  const userid = req.params['userid'];

  Auction.find({ seller: userid })
    .then((result) => {
      res.send(result);
    })
    .catch((err) => {
      console.log(err);
    })
};

module.exports.createAuction = (req, res) => {
  const { seller, productName, productSKU, shortProductName, condition, size, category, bin, startingPrice, minIncrement, deliveryFee, endTime } = req.body;
const object = JSON.parse(req.body);
  const image = object.image;
  const imageName = object.imageName;
  console.log(image.length);
  console.log(imageName.length);
  // for (let index = 0; index < imageName.length; index++) {
  //   var realFile = Buffer.from(image[index], "base64");
  //   fs.writeFile("images/" + imageName[index], realFile, function (err) {
  //     if (err) console.log(err);
  //   });
  // }

  // let auction = new Auction();
  // auction.productName = productName;
  // auction.productSKU = productSKU;
  // auction.shortProductName = shortProductName;
  // auction.condition = condition;
  // auction.size = size;
  // auction.startingPrice = startingPrice;
  // auction.minIncrement = minIncrement;
  // auction.bin = bin;
  // auction.deliveryFee = deliveryFee;
  // auction.endTime = endTime;
  // auction.photos = imageName;
  // auction.status = "ongoing";
  // auction.bids = [];
  // auction.trackingLink = 'dsds';
  // auction.rating = 0;
  // auction.seller = seller;
  // auction.category = category;
  // auction.save()
  //   .then((result) => {
  //     res.json(result);
  //   })
  //   .catch((err) => {
  //     console.log(err);
  //   })


  //console.log(image);
  //console.log(req.body);
};

module.exports.updateAuction = (req, res) => {
  const id = req.params["id"];
  const status = req.body;
  Auction.findByIdAndUpdate(id, status, function (err, doc) {
    if (err) {
      console.log(err);
    }
    res.send(doc);
  });
};

module.exports.deleteAuction = (req, res) => {
  const id = req.params["id"];
  res.send(`delete auction of id ${id}`);
};
