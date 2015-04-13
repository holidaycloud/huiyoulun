config = require "./../config/weixin.json"
crypto = require "crypto"
class WeixinCtrl
  @check:(timestamp,nonce,signature) ->
    tmp = [config.token, timestamp, nonce].sort().join('')
    currSign = crypto.createHash("sha1").update(tmp).digest("hex")
    currSign is signature
module.exports = WeixinCtrl
