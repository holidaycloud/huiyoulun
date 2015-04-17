request = require "request"
config = require "./../config/config.json"
class MemberCtrl
  @login:(loginName,password,fn) ->
    url = "#{config.inf.host}:#{config.inf.port}/User/authUser?loginName=#{loginName}&password=#{password}"
    request {url,timeout:3000},(err,response,body) ->
      if err
        fn err
      else
        res = if body? then JSON.parse(body) else {}
        if res.error?
          fn new Error(res.error)
        else
          fn null,res

  @weixinLogin:(openid,fn) ->
    url = "#{config.inf.host}:#{config.inf.port}/User/authUser?openId=#{openid}"
    request {url,timeout:3000},(err,response,body) ->
      if err
        fn err
      else
        res = if body? then JSON.parse(body) else {}
        if res.error?
          fn new Error(res.error)
        else
          fn null,res

  @bindWeChat:(loginName,password,openid,fn) ->
    url = "#{config.inf.host}:#{config.inf.port}/User/bindWeChat?loginName=#{loginName}&password=#{password}&openId=#{openid}"
    request {url,timeout:3000},(err,response,body) ->
      if err
        fn err
      else
        res = if body? then JSON.parse(body) else {}
        if res.error?
          fn new Error(res.error)
        else
          fn null,res

module.exports = MemberCtrl