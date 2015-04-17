// Generated by CoffeeScript 1.8.0
(function() {
  var MemberCtrl, ProductCtrl, WeixinCtrl, async;

  ProductCtrl = require("./../ctrl/productCtrl");

  MemberCtrl = require("./../ctrl/memberCtrl");

  WeixinCtrl = require("./../ctrl/weixinCtrl");

  async = require("async");

  exports.weixinLogin = function(req, res, next) {
    var code, state;
    console.log("----------weixinLogin------------");
    code = req.query.code;
    state = req.query.state;
    return async.auto({
      getOpenid: function(cb) {
        return WeixinCtrl.codeAccessToken(code, function(err, result) {
          console.log("----------codeAccessToken------------");
          console.log(err, result);
          return cb(err, result);
        });
      },
      autoLogin: [
        "getOpenid", function(cb, results) {
          var openid;
          openid = results.getOpenid.openid;
          return MemberCtrl.weixinLogin(openid, function(err, result) {
            console.log("----------autoLogin------------");
            console.log(err, result);
            return cb(err, result);
          });
        }
      ]
    }, function(err, results) {
      var user;
      if (err == null) {
        user = results.autoLogin;
        req.session.user = user;
        return next();
      } else {
        return res.status(500).end();
      }
    });
  };

  exports.login = function(req, res) {
    var code, state;
    code = req.query.code;
    state = req.query.state;
    return WeixinCtrl.codeAccessToken(code, function(err, result) {
      if (err) {
        return res.status(500).end();
      } else {
        return res.render("login", {
          openid: result.openid
        });
      }
    });
  };

  exports.doLogin = function(req, res) {
    var loginName, openid, password;
    loginName = req.body.loginName;
    password = req.body.password;
    openid = req.body.openid;
    return MemberCtrl.bindWeChat(loginName, password, openid, function(err, result) {
      if (err == null) {
        req.session.user = result;
      }
      return res.redirect("/");
    });
  };

  exports.checkLogin = function(req, res, next) {
    if (req.session.user != null) {
      return next();
    } else {
      return res.render("login");
    }
  };

  exports.index = function(req, res) {
    return ProductCtrl.productList(null, null, null, "2015-07", null, true, function(err, results) {
      return res.render("index", {
        products: results.productList
      });
    });
  };

  exports.search = function(req, res) {
    return res.render("search");
  };

  exports.detail = function(req, res) {
    var pid;
    pid = req.params.pid;
    return async.series([
      function(cb) {
        return ProductCtrl.productDetail(pid, function(err, result) {
          return cb(err, result);
        });
      }, function(cb) {
        return ProductCtrl.productFee(pid, function(err, result) {
          return cb(err, result);
        });
      }
    ], function(err, results) {
      var r;
      r = results[0];
      r.fees = results[1].fees;
      return res.render("prodInfo", r);
    });
  };

}).call(this);
