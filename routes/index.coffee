express = require "express"
router = express.Router()
PageAction = require "./../action/pageAction"

router.post "/dologin",PageAction.doLogin
router.all "*",PageAction.checkLogin
router.get "/",PageAction.index
router.get "/search",PageAction.search
router.get "/detail/:pid",PageAction.detail

module.exports = router