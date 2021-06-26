const User = require("../models/user");
const Watchlist = require("../models/watchlist");

module.exports.checkUsername = async (req, res) => {
  const username = req.query.username;
  const email = req.query.email;
  console.log(email);
  await User.findOne(
    { $or: [{ username: username }, { email: email }] },
    function (err, user) {
      if (err) {
        res.send(err);
      }
      if (user == null) {
        return res.json("success");
      } else {
        if (user.username === username) {
          return res.json(
            "The username already exists, please use another one."
          );
        } else if (user.email === email) {
          return res.json("The email already exists, please use another one.");
        }
      }
    }
  );
};

module.exports.register = async (req, res) => {
  const { username, password, email, phoneNo } = req.body;

  let user = new User();
  user.username = username;
  user.email = email;
  user.password = password;
  user.phoneNum = phoneNo;
  user.profilePhoto = "";
  user.bio = "";
  user.totalDeal = 0;
  user.rating = 0;
  user.address = {
    address1: "",
    address2: "",
    address3: "",
    postcode: "",
    state: "",
    country: "Malaysia",
  };
  user.payment = { card: "", expiryDate: "", cvv: "" };
  user.fbLink = "";
  user.igLink = "";
  user.lcLink = "";

  user.save();

  let watchlist = new Watchlist();
  watchlist.user = user.id;
  watchlist.auctions = [];
  watchlist.save();

  res.json({ isRegistered: 1 });
};
