ProductCtrl = require "./../ctrl/productCtrl"
MemberCtrl = require "./../ctrl/memberCtrl"
async = require "async"

exports.doLogin = (req,res) ->
  loginName = req.body.loginName
  password = req.body.password
  MemberCtrl.login loginName,password,(err,result) ->
    if not err?
      console.log "--------save user to session-----------"
      req.session.user = result
      console.log "-----user---------"
      console.log req.session.user
      console.log "------end user------------"
    res.redirect "/"

exports.checkLogin = (req,res,next) ->
  console.log "-----user---------"
  console.log req.session.user
  console.log "------end user------------"
  if req.session.user?
    next()
  else
    res.render "login"

exports.index = (req,res) ->
  ProductCtrl.productList(null, null, null, "2015-07", null,true,(err,results) ->
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
    res.render "prodInfo",r