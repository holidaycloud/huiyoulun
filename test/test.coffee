ProductCtrl = require "./../ctrl/productCtrl"
CommonsCtrl = require "./../ctrl/commonsCtrl"

#ProductCtrl.productList(null, null, null, "2015-02", null, (err,res) ->
#  console.log err,res
#)

#ProductCtrl.productDetail("351",(err,res) ->
#  console.log err,res
#)

#ProductCtrl.productFee("351",(err,res) ->
#  console.log err,JSON.stringify(res)
#)

CommonsCtrl.cruiseArea (err,res) ->
  console.log err,JSON.stringify(res)

CommonsCtrl.travelLocation (err,res) ->
  console.log err,JSON.stringify(res)

CommonsCtrl.ship (err,res) ->
  console.log err,JSON.stringify(res)