express = require "express"
router = express.Router()
PageAction = require "./../action/pageAction"

router.get "/",PageAction.index
router.get "/search",PageAction.search
router.get "/detail/:pid",PageAction.detail

module.exports = router