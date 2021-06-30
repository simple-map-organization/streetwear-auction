const express = require("express");
const router = express.Router();

const NotificationController = require("../controllers/notificationController");

router.get("/", NotificationController.getNotificationList);
router.get("/count", NotificationController.getNotificationCount);
router.put("/", NotificationController.updateNotification);

module.exports = router;
