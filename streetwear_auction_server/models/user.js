const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
  userId: String,
  username: String,
  email: String,
  password: String,
  phoneNum: String,
  profilePhoto: String,
  bio: String,
  totalDeal: Number,
  rating: Number,
  address: {
    address1: String,
    address2: String,
    address3: String,
    postcode: String,
    state: String,
    country: String,
  },
  payment: { card: String, expiryDate: String, cvv: String },
  fbLink: String,
  igLink: String,
  lcLink: String,
});

const User = mongoose.model("User", userSchema);

module.exports = User;
