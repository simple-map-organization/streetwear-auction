const mongoose = require("mongoose");

const watchlistSchema = mongoose.Schema({
    id: String,
    user: { type: mongoose.Schema.Types.ObjectId, ref: "User" },
    auctions: [{ type: mongoose.Schema.Types.ObjectId, ref: "Auction" }],
});

const Watchlist = mongoose.model("Watchlist", watchlistSchema);

module.exports = Watchlist;