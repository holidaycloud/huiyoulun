// Generated by CoffeeScript 1.8.0
(function() {
  var CommonsCtrl, MemberCtrl, ProductCtrl, WeixinCtrl;

  ProductCtrl = require("./../ctrl/productCtrl");

  CommonsCtrl = require("./../ctrl/commonsCtrl");

  MemberCtrl = require("./../ctrl/memberCtrl");

  WeixinCtrl = require("./../ctrl/weixinCtrl");

  MemberCtrl.weixinLogin("odZ6Yt0D_IHamVTEstBksyxLigvU", function(err, res) {
    return console.log(err, res);
  });

}).call(this);
