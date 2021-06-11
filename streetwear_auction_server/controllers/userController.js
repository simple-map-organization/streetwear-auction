const User = require("../models/user");

module.exports.getUser = async (req, res) => {
  const id = req.params.id;
  const user = await User.findById(id);
  res.json(user);
};

module.exports.updateUser = async (req, res) => {
  const id = req.params["id"];
  const newUserData = req.body;
  console.log(newUserData);
  const user = await User.findByIdAndUpdate(id, newUserData, {
    new: true,
    useFindAndModify: false,
  });
  res.json(user);
};
