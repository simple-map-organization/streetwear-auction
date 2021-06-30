const Notification = require("../models/notification");

module.exports.getNotificationList = async (req, res) => {
  const userId = req.id;
  let notifications = await Notification.find({ userId: userId }, null, {
    sort: { dateTime: -1 },
  }).populate("auctionId");
  res.json(notifications);
};

module.exports.addNotification = async (req, res) => {
  res.send();
};

module.exports.getNotificationCount = async (req, res) => {
  //get notification count
  const userId = req.id;
  let notificationCount = await Notification.count({
    userId: userId,
    read: false,
  });
  res.json(notificationCount);
};

// userModel.countDocuments({name: "sam"});
// userModel.countDocuments({name: "sam"}).exec(); //if you are using promise

module.exports.updateNotification = async (req, res) => {
  const { type, auctionId } = req.body;
  await Notification.updateMany(
    { userId: req.id, read: false, type: type, auctionId: auctionId },
    { $set: { read: true } }
  );
  res.json("updated");
};
