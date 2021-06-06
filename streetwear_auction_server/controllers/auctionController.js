const Auction = require("../models/auction");

module.exports.getAuctionList = async (req, res) => {
  const productName = req.query.productName;
  const category = req.query.category;

  let filterQuery = {};
  productName &&
    (filterQuery.productName = { $regex: productName, $options: "i" });
  category && (filterQuery.category = { $regex: category, $options: "i" });

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
  const userid = req.params["userid"];
  Auction.find({ seller: userid })
    .then((result) => {
      res.send(result);
    })
    .catch((err) => {
      console.log(err);
    })
};

module.exports.createAuction = (req, res) => {
  let auction = new Auction();
  auction.productName = "Sneaked into your house2222";
  auction.productSKU = "abc1231";
  auction.shortProductName = "SIYH";
  auction.condition = "Good";
  auction.size = "US10";
  auction.startingPrice = 100;
  auction.minIncrement = 10;
  auction.bin = 200;
  auction.deliveryFee = 5;
  auction.endTime = new Date();
  auction.photos = [
    "https://image.goat.com/crop/500/attachments/product_template_additional_pictures/images/012/219/525/original/335047_01.jpg.jpeg?1527188497",
    "https://image.goat.com/crop/500/attachments/product_template_additional_pictures/images/012/219/510/original/335047_06.jpg.jpeg?1527188481",
  ];
  auction.status = "shipped";
  auction.bids = [{ userId: "60afa472cdec953fc4d5e8ce", price: 123 }];
  auction.trackingLink = "abc";
  auction.rating = 4.9;
  auction.seller = "60afa472cdec953fc4d5e8ce";
  auction.category = "shirt";
  auction.save();
  res.send(`create auction`);
};

module.exports.updateAuction = (req, res) => {
  const id = req.params["id"];
  res.send(`update auction of id ${id}`);
};

module.exports.deleteAuction = (req, res) => {
  const id = req.params["id"];
  res.send(`delete auction of id ${id}`);
};
