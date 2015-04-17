ProductCtrl = require "./../ctrl/productCtrl"
CommonsCtrl = require "./../ctrl/commonsCtrl"
MemberCtrl = require "./../ctrl/memberCtrl"
WeixinCtrl = require "./../ctrl/weixinCtrl"

#WeixinCtrl.accessToken (err,res) ->
#  console.log err,res


MemberCtrl.weixinLogin "odZ6Yt0D_IHamVTEstBksyxLigvU",(err,res) ->
  console.log err,res

#ProductCtrl.productList(null, null, null, "2015-07", null,true, (err,res) ->
#  console.log err,res
#)

#ProductCtrl.productDetail("1098",(err,res) ->
#  console.log res
#)
#
#ProductCtrl.productFee("1098",(err,res) ->
#  console.log JSON.stringify(res)
#)

#CommonsCtrl.cruiseArea (err,res) ->
#  console.log err,JSON.stringify(res)
#
#CommonsCtrl.travelLocation (err,res) ->
#  console.log err,JSON.stringify(res)
#
#CommonsCtrl.ship (err,res) ->
#  console.log err,JSON.stringify(res)