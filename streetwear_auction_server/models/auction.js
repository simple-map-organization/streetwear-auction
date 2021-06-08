const mongoose = require("mongoose");

const auctionSchema = mongoose.Schema({
  id: String,
  productName: String,
  productSKU: String,
  shortProductName: String,
  condition: String,
  size: String,
  startingPrice: Number,
  minIncrement: Number,
  bin: Number,
  deliveryFee: Number,
  endTime: Date,
  photos: [String],
  bids: [
    {
      userId: { type: mongoose.Schema.Types.ObjectId, ref: "User" },
      price: Number,
    },
  ],
  status: String,
  trackingLink: String,
  rating: Number,
  seller: { type: mongoose.Schema.Types.ObjectId, ref: "User" },
  category: String, //sneaker, shirt, cap, etc..
});

const Auction = mongoose.model("Auction", auctionSchema);

module.exports = Auction;
