const mongoose = require("mongoose");

const notificationSchema = mongoose.Schema({
  content: String,
  dateTime: Date,
  type: Number,
});
const Notification = mongoose.model("notification", notificationSchema);

module.exports = Notification;
