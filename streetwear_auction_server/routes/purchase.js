const express = require("express");
const router = express.Router();

const purchaseController = require("../controllers/purchaseController");

router.get("/", purchaseController.getPurchaseList);
router.get("/user/:userId", purchaseController.getPurchaseByUserIdAndAuctionId);
router.get("/:auctionId", purchaseController.getUserPurchaseByAuctionId);
router.put("/:purchaseId", purchaseController.updatePurchase);
router.put("/updateStatus/:id", purchaseController.updateStatus);

module.exports = router;
