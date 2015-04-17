ProductCtrl = require "./../ctrl/productCtrl"
MemberCtrl = require "./../ctrl/memberCtrl"
WeixinCtrl = require "./../ctrl/weixinCtrl"
async = require "async"

exports.login = (req,res) ->
  code = req.query.code
  state = req.query.state
  WeixinCtrl.codeAccessToken code,(err,result) ->
    if err
      res.status(500).end()
    else
      res.render "login",openid:result.openid

exports.doLogin = (req,res) ->
  loginName = req.body.loginName
  password = req.body.password
  openid = req.body.openid
  console.log loginName,password,openid
  MemberCtrl.bindWeChat loginName,password,openid,(err,result) ->
    if not err?
      req.session.user = result
    res.redirect "/"

exports.checkLogin = (req,res,next) ->
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