const express = require("express");
const router = express.Router();

const AuctionController = require("../controllers/auctionController");

router.get("/seller", AuctionController.getSellerAuctionList);
router.get("/", AuctionController.getAuctionList);
router.get("/:id", AuctionController.getAuction);
router.post("/", AuctionController.createAuction);
router.put("/:id", AuctionController.updateAuction);
router.delete("/:id", AuctionController.deleteAuction);

module.exports = router;
