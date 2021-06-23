require("dotenv").config();
const mongoose = require("mongoose");
const Auction = require("../models/auction");
const Purchase = require("../models/purchase");
var fs = require("fs");

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

  let auctions = await Auction.find(filterQuery)
    .populate("bids.userId")
    .populate("seller");
  auctions.forEach((auction) => {
    auction.photos = auction.photos.map(
      (name) => `http://${process.env.IP}:3000/images/${name}`
    );
  });
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
    });
};

module.exports.getSellerAuctionList = async (req, res) => {
  const sellerId = req.id;
  const productName = req.query.productName;

  let filterQuery = {};
  filterQuery.seller = sellerId;
  productName &&
    (filterQuery.productName = { $regex: productName, $options: "i" });
  const auctions = await Auction.find(filterQuery)
    .populate("bids.userId")
    .populate("seller");
  auctions.forEach((auction) => {
    auction.photos = auction.photos.map(
      (name) => `http://${process.env.IP}:3000/images/${name}`
    );
  });

  res.json(auctions);
};

module.exports.createAuction = async (req, res) => {
  const {
    productName,
    productSKU,
    shortProductName,
    condition,
    size,
    category,
    bin,
    startingPrice,
    minIncrement,
    deliveryFee,
    endTime,
    imageName,
    image,
  } = req.body;
  const seller = req.id;
  for (let index = 0; index < imageName.length; index++) {
    var realFile = Buffer.from(image[index], "base64");
    fs.writeFile("public/images/" + imageName[index], realFile, function (err) {
      if (err) console.log(err);
    });
  }

  let auction = new Auction();
  auction.productName = productName;
  auction.productSKU = productSKU;
  auction.shortProductName = shortProductName;
  auction.condition = condition;
  auction.size = size;
  auction.startingPrice = startingPrice;
  auction.minIncrement = minIncrement;
  auction.bin = bin;
  auction.deliveryFee = deliveryFee;
  auction.endTime = endTime;
  auction.photos = imageName;
  auction.status = "ongoing";
  auction.bids = [];
  auction.trackingLink = "dsds";
  auction.rating = 0;
  auction.seller = seller;
  auction.category = category;
  const { _id } = await auction.save();
  let newAuction = await Auction.findById(_id)
    .populate("bids.userId")
    .populate("seller");

  newAuction.photos = newAuction.photos.map(
    (name) => `http://${process.env.IP}:3000/images/${name}`
  );

  return res.json(newAuction);
};

module.exports.updateAuction = (req, res) => {
  const id = req.params["id"];
  const status = req.body;
  Auction.findByIdAndUpdate(id, status, function (err, doc) {
    if (err) {
      console.log(err);
    }
    console.log(doc);
    res.send(doc);
  });
};

module.exports.bidAuction = async (req, res) => {
  const userId = req.id;
  const auctionId = req.params["auctionId"];
  const { price } = req.body;

  let auction = await Auction.findById(auctionId);
  let purchaseId;

  //bids already exists, update the price
  if (auction.bids.some((bid) => bid.userId == userId)) {
    await Auction.updateOne(
      { _id: auctionId, "bids.userId": userId },
      {
        $set: {
          "bids.$.price": price,
        },
      },
      { useFindAndModify: false }
    );
  } else {
    await Auction.findByIdAndUpdate(
      auctionId,
      {
        $push: {
          bids: {
            $each: [{ userId: userId, price: price }],
            $sort: { price: -1 },
          },
        },
      },
      { useFindAndModify: false }
    );
  }

  let updatedAuction = await Auction.findById(auctionId)
    .populate("bids.userId")
    .populate("seller");

  if (updatedAuction.bids[0].price >= updatedAuction.bin) {
    let purchases = updatedAuction.bids.map((bid) => {
      return {
        product: updatedAuction._id,
        user: bid.userId._id,
        won: false,
        status: "",
        payBefore: null,
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
    purchases[0].won = true;
    purchases[0].status = "To Pay";
    purchases[0].payBefore = new Date().setDate(new Date().getDate() + 7);

    await Purchase.insertMany(purchases);
  }

  res.json(updatedAuction);
};

module.exports.deleteAuction = (req, res) => {
  const id = req.params["id"];
  res.send(`delete auction of id ${id}`);
};
