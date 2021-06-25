const express = require("express");
require("dotenv").config();
const cors = require("cors");
const mongoose = require("mongoose");
const app = express();
const port = 3000;

const auctionRoute = require("./routes/auction");
const userRoute = require("./routes/user");
const notificationRoute = require("./routes/notification");
const loginRoute = require("./routes/login");
const registrationRoute = require("./routes/registration");
const purchaseRoute = require("./routes/purchase");
const UserAuthMiddleware = require("./middleware/authMiddleware");
const AuctionScheduler = require("./scheduler/auctionScheduler");

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
app.use(express.urlencoded({ limit: "50mb", extended: true }));
app.use(express.json());
app.use(cors());

app.get("/", (req, res) => res.send("Home Page!"));
app.use("/login", loginRoute);
app.use("/registration", registrationRoute);

//backend running schedule
AuctionScheduler;

//protected routes
app.use(UserAuthMiddleware);
app.use("/auction", auctionRoute);
app.use("/user", userRoute);
app.use("/notification", notificationRoute);
app.use("/purchase", purchaseRoute);


app.listen(port, () =>
  console.log(`Server running at http://${process.env.IP}:${port}`)
);
