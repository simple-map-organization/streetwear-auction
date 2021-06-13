const User = require("../models/user");
require('dotenv').config()
const jwt = require('jsonwebtoken')

module.exports.checkCredential = async (req, res) => {
  const username = req.params.username;
  const password = req.params.password;
  const user = await User.findOne({ username: username, password: password });
  if (user != null) {
    const token = jwt.sign({id: user._id},process.env.JWT_SECRET)
    res.json({ loginStatus: 1, jwt:token });
  } else {
    res.json({ loginStatus: 0 });
  }
};
