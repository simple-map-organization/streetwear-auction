const mongoose = require("mongoose");

const notificationSchema = mongoose.Schema({
  id: String,
  shortProductName: String,
  dateTime: Date,
  type: String,
  read: Boolean,
  userId: { type: mongoose.Schema.Types.ObjectId, ref: "User" },
  auctionId: { type: mongoose.Schema.Types.ObjectId, ref: "Auction" },
});
const Notification = mongoose.model("notification", notificationSchema);

module.exports = Notification;
