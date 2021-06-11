const express = require("express");
const cors = require("cors");
const mongoose = require("mongoose");
const app = express();
const port = 3000;

const auctionRoute = require("./routes/auction");
const userRoute = require("./routes/user");
const notificationRoute = require("./routes/notification");
const loginRoute = require("./routes/login");

mongoose.connect(
  "mongodb+srv://root:9Cs8v6FpAKmSuHF@cluster0.nebie.mongodb.net/test",
  { useNewUrlParser: true, useUnifiedTopology: true }
);

const db = mongoose.connection;
db.on("error", console.error.bind(console, "connection error:"));
db.once("open", function () {
  console.log("connected to mongodb");
});
app.use(express.json());
app.get("/", (req, res) => res.send("Home Page!"));
app.use(cors());
app.use("/auction", auctionRoute);
app.use("/user", userRoute);
app.use("/notification", notificationRoute);
app.use("/login", loginRoute);

app.listen(port, () =>
  console.log(`Server running at http://localhost:${port}`)
);
