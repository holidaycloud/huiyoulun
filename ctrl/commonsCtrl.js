// Generated by CoffeeScript 1.8.0
(function() {
  var CommonsCtrl;

  CommonsCtrl = (function() {
    var config, request;

    function CommonsCtrl() {}

    request = require("request");

    config = require("./../config/config.json");

    CommonsCtrl.cruiseArea = function(fn) {
      var url;
      url = "" + config.inf.host + ":" + config.inf.port + "/cruisearea/getall";
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

    CommonsCtrl.travelLocation = function(fn) {
      var url;
      url = "" + config.inf.host + ":" + config.inf.port + "/travellocation/getStartLocations";
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

    CommonsCtrl.ship = function(fn) {
      var url;
      url = "" + config.inf.host + ":" + config.inf.port + "/ship/getcompanies";
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

    return CommonsCtrl;

  })();

  module.exports = CommonsCtrl;

}).call(this);
