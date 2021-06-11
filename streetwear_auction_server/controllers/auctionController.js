const mongoose = require("mongoose");
const Auction = require("../models/auction");

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
  const { seller, productName, productSKU, shortProductName, condition, size, category } = req.body;
  let auction = new Auction();
  auction.productName = productName;
  auction.productSKU = productSKU;
  auction.shortProductName = shortProductName;
  auction.condition = condition;
  auction.size = size;
  auction.startingPrice = 90;
  auction.minIncrement = 50;
  auction.bin = 2500;
  auction.deliveryFee = 13;
  auction.endTime = new Date();
  auction.photos = ['https://image.goat.com/crop/500/attachments/product_template_additional_pictures/images/012/219/525/original/335047_01.jpg.jpeg?1527188497'];
  auction.status = "ongoing";
  auction.bids = [];
  auction.trackingLink = 'dsds';
  auction.rating = 0;
  auction.seller = seller;
  auction.category = category;
  auction.save()
    .then((result) => {
      res.json(result);
    })
    .catch((err) => {
      console.log(err);
    })
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
