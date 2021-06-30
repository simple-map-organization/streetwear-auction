const Auction = require("../models/auction");
const Purchase = require("../models/purchase");
const Notification = require("../models/notification");
var fs = require("fs");

module.exports.getAuctionList = async (req, res) => {
  const host = req.headers.host;
  const productName = req.query.productName;
  const category = req.query.category;

  let filterQuery = {};
  productName &&
    (filterQuery.productName = { $regex: productName, $options: "i" });
  category && (filterQuery.category = { $regex: category, $options: "i" });
  filterQuery.status = { $eq: "Ongoing" };

  let auctions = await Auction.find(filterQuery)
    .populate("bids.userId")
    .populate("seller");
  auctions.forEach((auction) => {
    auction.photos = auction.photos.map(
      (name) => `http://${host}/images/${name}`
    );
  });

  res.json(auctions);
};

module.exports.getAuction = async (req, res) => {
  const host = req.headers.host;

  const id = req.params["id"];
  let auction = await Auction.findById(id)
    .populate("bids.userId")
    .populate("seller");

  auction.photos = auction.photos.map(
    (name) => `http://${host}/images/${name}`
  );

  res.json(auction);
};

module.exports.getSellerAuctionList = async (req, res) => {
  const host = req.headers.host;
  const sellerId = req.id;
  const productName = req.query.productName;

  let filterQuery = {};
  filterQuery.seller = sellerId;
  productName &&
    (filterQuery.productName = { $regex: productName, $options: "i" });
  const auctions = await Auction.find(filterQuery)
    .populate("bids.userId")
    .populate("seller");
  auctions.forEach((auction) => {
    auction.photos = auction.photos.map(
      (name) => `http://${host}/images/${name}`
    );
  });

  res.json(auctions);
};

module.exports.createAuction = async (req, res) => {
  const host = req.headers.host;
  const {
    productName,
    productSKU,
    shortProductName,
    condition,
    size,
    category,
    bin,
    startingPrice,
    minIncrement,
    deliveryFee,
    endTime,
    imageName,
    image,
  } = req.body;
  const seller = req.id;
  for (let index = 0; index < imageName.length; index++) {
    var realFile = Buffer.from(image[index], "base64");
    fs.writeFile("public/images/" + imageName[index], realFile, function (err) {
      if (err) console.log(err);
    });
  }

  let auction = new Auction();
  auction.productName = productName;
  auction.productSKU = productSKU;
  auction.shortProductName = shortProductName;
  auction.condition = condition;
  auction.size = size;
  auction.startingPrice = startingPrice;
  auction.minIncrement = minIncrement;
  auction.bin = bin;
  auction.deliveryFee = deliveryFee;
  auction.endTime = endTime;
  auction.photos = imageName;
  auction.status = "Ongoing";
  auction.bids = [];
  auction.trackingLink = "";
  auction.rating = null;
  auction.seller = seller;
  auction.category = category;
  const { _id } = await auction.save();
  let newAuction = await Auction.findById(_id)
    .populate("bids.userId")
    .populate("seller");

  newAuction.photos = newAuction.photos.map(
    (name) => `http://${host}/images/${name}`
  );

  return res.json(newAuction);
};

module.exports.updateAuction = async (req, res) => {
  const id = req.params["id"];
  const status = req.body;
  //send notification to buyer
  console.log(status.status);
  let auction = await Auction.findById(id);

  console.log(auction);
  if (status.status == "To Receive") {
    let notification = new Notification();
    notification.shortProductName = auction.shortProductName;
    notification.dateTime = Date.now();
    notification.type = "shipout";
    notification.userId = auction.bids[0].userId._id;
    notification.auctionId = id;
    notification.read = false;

    notification.save();
  }
  Auction.findByIdAndUpdate(id, status, function (err, doc) {
    if (err) {
      console.log(err);
    }
    res.send(doc);
  });
};

module.exports.bidAuction = async (req, res) => {
  const userId = req.id;
  const auctionId = req.params["auctionId"];
  const { price } = req.body;

  let auction = await Auction.findById(auctionId);

  //add notification to previous winner
  if (auction.bids.length != 0) {
    console.log("1");
    previousWinnerId = auction.bids[0].userId;
    let notification = new Notification();
    notification.shortProductName = auction.shortProductName;
    notification.dateTime = Date.now();
    notification.type = "outbidded";
    notification.userId = previousWinnerId;
    notification.auctionId = auction._id;
    notification.read = false;

    notification.save();
  }

  //bids already exists, update the price
  if (auction.bids.some((bid) => bid.userId == userId)) {
    await Auction.updateOne(
      { _id: auctionId, "bids.userId": userId },
      {
        $set: {
          "bids.$.price": price,
        },
      },
      { useFindAndModify: false }
    );
    //sort
    await Auction.findByIdAndUpdate(
      auctionId,
      {
        $push: {
          bids: {
            $each: [],
            $sort: { price: -1 },
          },
        },
      },
      { useFindAndModify: false }
    );
  } else {
    await Auction.findByIdAndUpdate(
      auctionId,
      {
        $push: {
          bids: {
            $each: [{ userId: userId, price: price }],
            $sort: { price: -1 },
          },
        },
      },
      { useFindAndModify: false }
    );
  }

  let updatedAuction = await Auction.findById(auctionId)
    .populate("bids.userId")
    .populate("seller");

  let purchases = updatedAuction.bids.map((bid) => {
    return {
      product: updatedAuction._id,
      user: bid.userId._id,
      won: false,
      payBefore: null,
      delivery: {
        fullname: "",
        phone: "",
        address1: "",
        address2: "",
        postcode: "",
        state: "",
        country: "",
      },
    };
  });

  if (updatedAuction.bids[0].price >= updatedAuction.bin) {
    //send notification to winner

    let notification1 = new Notification();
    notification1.shortProductName = updatedAuction.shortProductName;
    notification1.dateTime = Date.now();
    notification1.type = "wonAnAuction";
    notification1.userId = updatedAuction.bids[0].userId;
    notification1.auctionId = updatedAuction._id;
    notification1.read = false;

    notification1.save();

    let notification2 = new Notification();
    //send notification to seller
    notification2.shortProductName = updatedAuction.shortProductName;
    notification2.dateTime = Date.now();
    notification2.type = "auctionEnded";
    notification2.userId = updatedAuction.seller._id;
    notification2.auctionId = updatedAuction._id;
    notification2.read = false;

    notification2.save();

    let purchases = updatedAuction.bids.map((bid) => {
      return {
        product: updatedAuction._id,
        user: bid.userId._id,
        won: false,
        payBefore: null,
        paidOn: null,
        delivery: {
          fullname: "",
          phone: "",
          address1: "",
          address2: "",
          postcode: "",
          state: "",
          country: "",
        },
      };
    });

    updatedAuction.status = "Payment Pending";
    updatedAuction.save();
    purchases[0].won = true;
    purchases[0].payBefore = new Date().setDate(new Date().getDate() + 7);

    await Purchase.insertMany(purchases);
  }

  res.json(updatedAuction);
};

module.exports.deleteAuction = (req, res) => {
  const id = req.params["id"];
  res.send(`delete auction of id ${id}`);
};
