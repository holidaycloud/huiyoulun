// Generated by CoffeeScript 1.8.0
(function() {
  var MemberCtrl, config, request;

  request = require("request");

  config = require("./../config/config.json");

  MemberCtrl = (function() {
    function MemberCtrl() {}

    MemberCtrl.login = function(loginName, password, fn) {
      var url;
      url = "" + config.inf.host + ":" + config.inf.port + "/User/authUser?loginName=" + loginName + "&password=" + password;
      return request({
        url: url,
        timeout: 3000
      }, function(err, response, body) {
        var res;
        if (err) {
          return fn(err);
        } else {
          res = body != null ? JSON.parse(body) : {};
          if (res.error != null) {
            return fn(new Error(res.error));
          } else {
            return fn(null, res);
          }
        }
      });
    };

    MemberCtrl.bindWeChat = function(loginName, password, openid, fn) {
      var url;
      url = "" + config.inf.host + ":" + config.inf.port + "/User/bindWeChat?loginName=" + loginName + "&password=" + password + "&openId=" + openid;
      return request({
        url: url,
        timeout: 3000
      }, function(err, response, body) {
        var res;
        if (err) {
          return fn(err);
        } else {
          res = body != null ? JSON.parse(body) : {};
          if (res.error != null) {
            return fn(new Error(res.error));
          } else {
            return fn(null, res);
          }
        }
      });
    };

    return MemberCtrl;

  })();

  module.exports = MemberCtrl;

}).call(this);
