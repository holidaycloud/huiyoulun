request = require "request"
config = require "./../config/config.json"
class ProductCtrl
  @productList: (type,page=1,max=10,startDate,order="startDate",recommendedOnly=false,fn) ->
    url = "#{config.inf.host}:#{config.inf.port}/product/getlist?#{"type="+type if type?}&page=#{page}&max=#{max}&startDate=#{startDate}&order=#{order}&recommendedOnly=#{recommendedOnly}"
    request {url,timeout:3000},(err,response,body) ->
      if err
        fn err
      else
        res = if body? then JSON.parse(body) else {}
        if res.error?
          fn new Error(res.error)
        else
          fn null,res

  @productDetail:(pid,fn) ->
    url = "#{config.inf.host}:#{config.inf.port}/product/getdetail?productId=#{pid}"
    request {url,timeout:3000},(err,response,body) ->
      if err
        fn err
      else
        res = if body? then JSON.parse(body) else {}
        if res.error?
          fn new Error(res.error)
        else
          fn null,res

  @productFee:(pid,fn) ->
    url = "#{config.inf.host}:#{config.inf.port}/product/getfees?productId=#{pid}"
    request {url,timeout:3000},(err,response,body) ->
      if err
        fn err
      else
        res = if body? then JSON.parse(body) else {}
        if res.error?
          fn new Error(res.error)
        else
          fn null,res
module.exports = ProductCtrl