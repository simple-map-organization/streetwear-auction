const express = require("express");
const router = express.Router();

const Notification = require("../models/notification");

router.get("/", (req, res) => {
  res.send("notification home");
});

module.exports = router;
