const cron = require('node-cron');
const Auction = require("../models/auction");
const Purchase = require("../models/purchase");


module.exports = cron.schedule('* * * * *',async ()=>{
    let auctions = await Auction.find({status: "ongoing"}).populate({
        path: "bids.userId", select:"username"
    });
    auctions.forEach(auction => {
        if(auction.endTime <= Date.now()){
            let winnerIndex = 0, highestBid = auction.bids[winnerIndex].price;
            for (let index = 1; index < auction.bids.length; index++) {
                const bid = auction.bids[index];
                if(bid.price > highestBid){
                    winnerIndex = index;
                    highestBid = bid.price;
                }
            }

            auction.status = "Payment Pending";
            auction.save();
            let wonPurchase = new Purchase();
            wonPurchase.product = auction;
            wonPurchase.user = auction.bids[winnerIndex].userId;
            wonPurchase.won = true;
            wonPurchase.payBefore = new Date().setDate(new Date().getDate() + 7);
            wonPurchase.delivery = {
                fullname: "",
                phone: "",
                address1: "",
                address2: "",
                postcode: "",
                state: "",
                country: "Malaysia",
              },
            wonPurchase.save();

            for (let index = 0; index < auction.bids.length; index++) {
                if(index != winnerIndex){
                    let lostPurchase = new Purchase();
                    lostPurchase.product = auction;
                    lostPurchase.user = auction.bids[winnerIndex].userId;
                    lostPurchase.won = false;
                    lostPurchase.payBefore= null;
                    lostPurchase.delivery = {
                        fullname: "",
                        phone: "",
                        address1: "",
                        address2: "",
                        postcode: "",
                        state: "",
                        country: "Malaysia",
                      };
                      lostPurchase.save();
                }
            }
            console.log('Auction List Updated');
        }
    });
});