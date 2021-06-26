const express = require("express");
const router = express.Router();

const purchaseController = require("../controllers/purchaseController");

router.get("/", purchaseController.getPurchaseList);
router.put("/:purchaseId", purchaseController.updatePurchase);
router.put("/updateStatus/:id", purchaseController.updateStatus);
router.get("/:auctionId", purchaseController.getUserPurchaseByAuctionId);

module.exports = router;
