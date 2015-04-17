express = require "express"
router = express.Router()
PageAction = require "./../action/pageAction"

router.post "/dologin",PageAction.doLogin
router.get "/",PageAction.weixinLogin,PageAction.index
router.get "/login",PageAction.login
router.get "/search",PageAction.search
router.get "/detail/:pid",PageAction.detail

module.exports = router