const User = require("../models/user");
var fs = require("fs");

module.exports.getUser = async (req, res) => {
  const host = req.headers.host;
  const id = req.id;
  const user = await User.findById(id);
  if (user.profilePhoto !== "")
    user.profilePhoto = `http://${host}/images/${user.profilePhoto}`;
  res.json(user);
};

module.exports.updateUser = async (req, res) => {
  const id = req.id;
  const newUserData = req.body;

  delete newUserData.profilePhoto;

  const user = await User.findByIdAndUpdate(id, newUserData, {
    new: true,
    useFindAndModify: false,
  });
  res.json(user);
};

module.exports.uploadImage = async (req, res) => {
  const host = req.headers.host;
  const id = req.id;
  const { image, name } = req.body;
  var realFile = Buffer.from(image, "base64");
  fs.writeFile("public/images/" + name, realFile, function (err) {
    if (err) console.log(err);
  });
  await User.findByIdAndUpdate(
    id,
    { profilePhoto: name },
    { new: true, useFindAndModify: false }
  );
  res.json(`http://${host}/images/${name}`);
};
