ProductCtrl = require "./../ctrl/productCtrl"
async = require "async"
exports.index = (req,res) ->
  ProductCtrl.productList(null, null, null, "2015-07", null,true,(err,results) ->
    console.log results
    res.render "index",products:results.productList
  )

exports.search = (req,res) ->
  res.render "search"

exports.detail = (req,res) ->
  pid = req.params.pid
  async.series [
    (cb) ->
      ProductCtrl.productDetail pid,(err,result) ->
        cb err,result
    ,(cb) ->
      ProductCtrl.productFee pid,(err,result) ->
        cb err,result
  ],(err,results) ->
    r = results[0]
    r.fees = results[1].fees
    console.log r
    res.render "prodInfo",r