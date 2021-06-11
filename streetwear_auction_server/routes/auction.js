const express = require("express");
const router = express.Router();

const AuctionController = require("../controllers/auctionController");

router.get("/", AuctionController.getAuctionList);
router.get("/:id", AuctionController.getAuction);
router.get("/seller/:userid", AuctionController.getUserAuctionList);
router.get("/", AuctionController.getUserAuctionList);
router.post("/", AuctionController.createAuction);
router.put("/:id", AuctionController.updateAuction);
router.delete("/:id", AuctionController.deleteAuction);

module.exports = router;
