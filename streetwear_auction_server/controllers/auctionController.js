const Auction = require("../models/auction");

module.exports.getAuctionList = (req, res) => {
  res.send("get all auction");
};

module.exports.getAuction = (req, res) => {
  const id = req.params["id"];
  res.send(`get auction of id ${id}`);
};
module.exports.createAuction = (req, res) => {
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

// let auction = new Auction();
// auction.productName = "Sneaked into your house";
// auction.productSKU = "abc123";
// auction.shortProductName = "SIYH";
// auction.condition = "Good";
// auction.startingPrice = 100;
// auction.minIncrement = 10;
// auction.BIN = 2;
// auction.deliveryFee = 5;
// auction.endTime = new Date();
// auction.photos = [
//   "https://image.goat.com/crop/500/attachments/product_template_additional_pictures/images/012/219/525/original/335047_01.jpg.jpeg?1527188497",
//   "https://image.goat.com/crop/500/attachments/product_template_additional_pictures/images/012/219/510/original/335047_06.jpg.jpeg?1527188481",
// ];
// auction.status = "shipped";
// auction.bids = [{ userId: "60afa472cdec953fc4d5e8ce", price: 123 }];
// auction.trackingLink = "abc";
// auction.rating = 5;
// auction.save();
