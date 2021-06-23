const mongoose = require("mongoose");

const purchaseSchema = mongoose.Schema({
  product: { type: mongoose.Schema.Types.ObjectId, ref: "Auction" },
  user: { type: mongoose.Schema.Types.ObjectId, ref: "User" },
  won: Boolean,
  status: String, //Cancelled(failed to pay) if failed to pay
  payBefore: Date, //1 week
  delivery: {
    fullname: String,
    phone: String,
    address1: String,
    address2: String,
    postcode: String,
    state: String,
    country: String,
  },
});

const Purchase = mongoose.model("Purchase", purchaseSchema);

module.exports = Purchase;
