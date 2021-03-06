require("dotenv").config();
const express = require("express");
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
const watchlistRoute = require("./routes/watchlist");

mongoose.connect(process.env.MONGO_URI, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

const db = mongoose.connection;
db.on("error", console.error.bind(console, "connection error:"));
db.once("open", function () {
  console.log("connected to mongodb");
  require("./scheduler/auctionScheduler");
});

app.use(express.static("public"));

app.use(express.json({ limit: "50mb" }));
app.use(express.urlencoded({ limit: "50mb", extended: true }));
app.use(express.json());
app.use(cors());

app.get("/", (req, res) => res.send("Home Page!"));
app.use("/login", loginRoute);
app.use("/registration", registrationRoute);

app.use("/auction", UserAuthMiddleware, auctionRoute);
app.use("/user", UserAuthMiddleware, userRoute);
app.use("/notification", UserAuthMiddleware, notificationRoute);
app.use("/watchlist", UserAuthMiddleware, watchlistRoute);
app.use("/purchase", UserAuthMiddleware, purchaseRoute);

app.listen(port, () =>
  console.log(`Server running at http://localhost:${port}`)
);
