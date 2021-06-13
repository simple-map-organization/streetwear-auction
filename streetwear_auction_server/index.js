const express = require("express");
const cors = require("cors");
const mongoose = require("mongoose");
const app = express();
const port = 3000;

main();

async function main() {
  const localIp = await getLocalIp();

  const auctionRoute = require("./routes/auction");
  const userRoute = require("./routes/user");
  const notificationRoute = require("./routes/notification");

  mongoose.connect(
    "mongodb+srv://root:9Cs8v6FpAKmSuHF@cluster0.nebie.mongodb.net/test",
    { useNewUrlParser: true, useUnifiedTopology: true }
  );

  const db = mongoose.connection;
  db.on("error", console.error.bind(console, "connection error:"));
  db.once("open", function () {
    console.log("connected to mongodb");
  });

  app.use(express.static("public"));

  app.use(express.json({ limit: "50mb" }));
  app.use(express.urlencoded({ limit: "50mb" }));

  app.get("/", (req, res) => res.send("Home Page!"));
  app.use(cors());
  app.use("/auction", auctionRoute);
  app.use("/user", userRoute);
  app.use("/notification", notificationRoute);

  app.listen(port, () =>
    console.log(`Server running at http://${localIp}:${port}`)
  );
}

async function getLocalIp() {
  return new Promise((resolve, reject) => {
    require("dns").lookup(require("os").hostname(), function (err, add, fam) {
      resolve(add);
    });
  });
}
