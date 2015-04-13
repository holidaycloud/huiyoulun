https = require "https"
fs = require "fs"
config = require "./../config/config.json"
class MemberCtrl
  @login:(loginName,password,fn) ->
    options =
      hostname: "www.huiyoulun.com"
      port: 443
      path: "/services/authuser?loginName=#{loginName}&password=#{password}"
      method: 'GET'
      rejectUnauthorized:true
    req = https.request options,(res) ->
      res.setEncoding "utf8"
      _data=""
      res.on "data",(chunk) ->
        _data += chunk
      res.on "end",() ->
        console.log _data
        result = JSON.parse _data
        fn null,result

    req.end();
    req.on "error",(e) ->
      console.log e
      fn e

module.exports = MemberCtrl