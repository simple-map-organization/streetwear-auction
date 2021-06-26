const express = require("express");
const router = express.Router();

const WatchlistController = require("../controllers/watchlistController");

router.get("/", WatchlistController.getWatchlistByUser);
router.get("/:productName", WatchlistController.getFilteredWatchlistByUser);
router.put("/", WatchlistController.addToWatchlist);

module.exports = router;