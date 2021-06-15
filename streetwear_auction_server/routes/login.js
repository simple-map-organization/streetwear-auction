const express = require("express");
const router = express.Router();

const loginController = require("../controllers/loginController");

router.post("/", loginController.checkCredential);

module.exports = router;
