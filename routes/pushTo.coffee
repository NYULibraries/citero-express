serviceFormat = (to) ->
  switch to.toLowerCase()
    when "easybib"
      "easybib"
    when "refworks"
      "refworks_tagged"
    else
      "ris"

serviceAction = (to) ->
  switch to.toLowerCase()
    when "refworks"
      "http://www.refworks.com/express/ExpressImport.asp?vendor=Citero&filter=RefWorks%20Tagged%20Format&encoding=65001"
    when "easybib"
      "http://www.easybib.com/cite/bulk"
    else
      ""

serviceElementName = (to) ->
  switch to.toLowerCase()
    when "refworks"
      "ImportData"
    else
      "data"

serviceDataDecoration = (to,data) ->
  switch to.toLowerCase()
    when "easybib"
      "[#{data}]"
    else
      data

fullServiceName = (to) ->
  switch to.toLowerCase()
    when "easybib"
      "EasyBib"
    when "refworks"
      "RefWorks"
    else
      to

exports.post = (req, res) ->
  Citero = require("citero").Citero
  res.render "pushTo",
    data: serviceDataDecoration(req.body.to_service,Citero.map(req.body.data).from(req.body.from_format).to(serviceFormat(req.body.to_service))),
    service: fullServiceName(req.body.to_service),
    action: serviceAction(req.body.to_service,req.body.data),
    elementName: serviceElementName(req.body.to_service),
    id: serviceElementName(req.body.to_service)
  return
