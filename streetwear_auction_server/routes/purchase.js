const express = require("express");
const router = express.Router();

const purchaseController = require("../controllers/purchaseController");

router.get("/", purchaseController.getPurchaseList);
router.put("/updateStatus/:id", purchaseController.updateStatus);  

module.exports = router;