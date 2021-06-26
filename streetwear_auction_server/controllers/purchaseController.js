require("dotenv").config();
const mongoose = require("mongoose");
const Purchase = require("../models/purchase");

module.exports.getPurchaseList = async (req, res) => {
    const id= req.id;
    let purchase = await Purchase.find({user: id}).populate({ 
      path: 'product',
      populate: {
        path: 'seller',
        select: 'username'
      } 
   });
    
    for (let index = 0; index < purchase.length; index++) {
      purchase[index].product = {...purchase[index].product};
      for (let i = 0; i < purchase[index].product.photos.length; i++) {
        purchase[index].product.photos[i] = `http://${process.env.IP}:3000/images/${purchase[index].product.photos[i]}`;
        
      }
    }

    res.json(purchase);
  };

module.exports.updateStatus = async (req, res) => {
  const id = req.params['id'];
  const {rating} = req.body;
  let purchase = await Purchase.findById(id).populate('product');

  if(purchase!=null){
    switch(purchase.status){
      case 'To Pay': purchase.status = 'To Ship';
      break;
      case 'To Ship': purchase.status = 'To Receive';
      break;
      case 'To Receive': purchase.status = 'To Rate';
      break;
      case 'To Rate': purchase.status = 'Completed';
      break;
    }

    if(rating){
      purchase.product.rating = rating;
      await purchase.product.save();
    }
    await purchase.save();
    res.json(purchase);
  }

}