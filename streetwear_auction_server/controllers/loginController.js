const User = require("../models/user");

module.exports.checkCredential = async (req, res) => {
  const username = req.params.username;
  const password = req.params.password;
  const user = await User.findOne({ username: username, password: password });
  if (user != null) {
    res.json({ loginStatus: 1, id: user._id });
  } else {
    res.json({ loginStatus: 0 });
  }
};
