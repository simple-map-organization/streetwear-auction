const User = require("../models/user");
var fs = require("fs");

module.exports.getUser = async (req, res) => {
  const id = req.id;
  const user = await User.findById(id);
  if(user.profilePhoto!=="")
  user.profilePhoto = `http://${process.env.IP}:3000/images/${user.profilePhoto}`;
  res.json(user);
};

module.exports.updateUser = async (req, res) => {
  const id = req.id;
  const newUserData = req.body;

  const user = await User.findByIdAndUpdate(id, newUserData, {
    new: true,
    useFindAndModify: false,
  });
  res.json(user);
};


module.exports.uploadImage = async (req, res) => {
  const id = req.id;
  const {image,name} = req.body
  var realFile = Buffer.from(image, "base64");
    fs.writeFile("public/images/" + name, realFile, function (err) {
      if (err) console.log(err);
    });
    console.log(name);
  await User.findByIdAndUpdate(id,{profilePhoto:name},{new: true,
    useFindAndModify: false});
  res.json(`http://${process.env.IP}:3000/images/${name}`);
  }
