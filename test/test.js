// Generated by CoffeeScript 1.8.0
(function() {
  var CommonsCtrl, MemberCtrl, ProductCtrl;

  ProductCtrl = require("./../ctrl/productCtrl");

  CommonsCtrl = require("./../ctrl/commonsCtrl");

  MemberCtrl = require("./../ctrl/memberCtrl");

  MemberCtrl.login("zzy@holidaycloud.cn", "20070428", function(err, res) {
    return console.log(err, res);
  });

}).call(this);
