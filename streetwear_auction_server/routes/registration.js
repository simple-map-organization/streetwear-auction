const express = require("express");
const router = express.Router();

const User = require("../models/user");

const registerController = require("../controllers/registrationController");

router.get("/", registerController.checkUsername);

router.post("/", registerController.register);

module.exports = router;
