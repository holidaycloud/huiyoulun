config = require "./../config/weixin.json"
request = require "request"
crypto = require "crypto"
class WeixinCtrl
  @check:(timestamp,nonce,signature) ->
    tmp = [config.token, timestamp, nonce].sort().join('')
    currSign = crypto.createHash("sha1").update(tmp).digest("hex")
    currSign is signature

  @accessToken:(fn) ->
    url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=#{config.appID}&secret=#{config.appSecret}"
    request {url,timeout:3000},(err,response,body) ->
      if err
        fn err
      else
        res = if body? then JSON.parse(body) else {}
        if res.error?
          fn new Error(res.error)
        else
          fn null,res

  @codeAccessToken:(code,fn) ->
    url = "https://api.weixin.qq.com/sns/oauth2/access_token?grant_type=authorization_code&appid=#{config.appID}&secret=#{config.appSecret}&code=#{code}"
    request {url,timeout:3000},(err,response,body) ->
      if err
        fn err
      else
        res = if body? then JSON.parse(body) else {}
        if res.error?
          fn new Error(res.error)
        else
          fn null,res


module.exports = WeixinCtrl
