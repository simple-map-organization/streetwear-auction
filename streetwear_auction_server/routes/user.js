const express = require("express");
const router = express.Router();

const userController = require("../controllers/userController");

router.get("/", (req, res) => {
  // let user = new User();

  // user.userId = "";
  // user.username = "";
  // user.email = "";
  // user.password = "";
  // user.phoneNum = "";
  // user.profilePhoto = "";
  // user.bio = "";
  // user.totalDeal = 0;
  // user.rating = 0;
  // user.address = {
  //   address1: "",
  //   address2: "",
  //   address3: "",
  //   postcode: 8100,
  //   state: "",
  //   country: "",
  // };
  // user.payment = { card: "xxxx xxxx", expiryDate: "", cvv: "120" };
  // user.fbLink = "abc";
  // user.igLink = "abc";
  // user.lcLink = "abc";
  // user.save();
  res.send("user home");
});

router.get("/:username/:password",userController.checkCredential)

module.exports = router;

