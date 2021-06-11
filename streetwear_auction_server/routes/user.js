const express = require("express");
const User = require("../models/user");
const router = express.Router();

const userController = require("../controllers/userController");

router.get("/:id", userController.getUser);
router.put("/:id", userController.updateUser);

module.exports = router;
