const e = require("express");
const mongoose = require("mongoose");
const Watchlist = require("../models/watchlist");

module.exports.getWatchlistByUser = async (req, res) => {
  const id = req.id;
  let watchlist = await Watchlist.findOne({ user: id }).populate({
    path: 'auctions',
    populate: {
      path: 'seller',
      model: 'User'
    }
  }).populate("user");
  watchlist.auctions.forEach((auction) => {
    auction.photos = auction.photos.map(
      (name) => `http://${process.env.IP}:3000/images/${name}`
    );
  });
  res.json(watchlist);
};

module.exports.getFilteredWatchlistByUser = async (req, res) => {
  const productName = req.params["productName"];
  const id = req.id;
  let filterQuery = {};
  (filterQuery.user = id);
  productName &&
    (filterQuery.productName = { $regex: productName, $options: "i" });
  console.log(filterQuery);
  let watchlist = await Watchlist.findOne(filterQuery).populate({
    path: 'auctions',
    populate: {
      path: 'seller',
      model: 'User'
    }
  }).populate("user");
  watchlist.auctions.forEach((auction) => {
    auction.photos = auction.photos.map(
      (name) => `http://${process.env.IP}:3000/images/${name}`
    );
  });
  res.json(watchlist);
};

module.exports.addToWatchlist = async (req, res) => {
  const auctionID = req.body.auctionID;
  const id = req.id;
  let watchlist = await Watchlist.findOne({ user: id });
  if (watchlist.auctions.includes(auctionID)) {
    res.json(null);
  }
  else {
    Watchlist.findOneAndUpdate({ user: id }, { $push: { auctions: auctionID } },
      function (error, doc) {
        if (error) {
          console.log(error);
        } else {
          res.json("Updated");
        }
      }
    );
  }
};