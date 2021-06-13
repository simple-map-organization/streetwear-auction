const mongoose = require("mongoose");
const Auction = require("../models/auction");
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
    });
};

module.exports.getUserAuctionList = (req, res) => {
  const status = req.query.status;
  const userid = req.params["userid"];

  Auction.find({ seller: userid })
    .then((result) => {
      res.send(result);
    })
    .catch((err) => {
      console.log(err);
    });
};

module.exports.createAuction = async (req, res) => {
  const {
    seller,
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
  const localIp = await getLocalIp(); // temporary
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
  auction.photos = imageName.map(
    (image) => `http://${localIp}:3000/images/${image}` // temporary
  );
  auction.status = "ongoing";
  auction.bids = [];
  auction.trackingLink = "dsds";
  auction.rating = 0;
  auction.seller = seller;
  auction.category = category;
  auction
    .save()
    .then((result) => {
      res.json(result);
    })
    .catch((err) => {
      console.log(err);
    });

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

async function getLocalIp() {
  return new Promise((resolve, reject) => {
    require("dns").lookup(require("os").hostname(), function (err, add, fam) {
      resolve(add);
    });
  });
}
