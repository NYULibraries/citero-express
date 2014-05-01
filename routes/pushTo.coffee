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
  if(fullServiceName(req.body.to_service) == "endnote")
    fs = require("fs")
    crypto = require('crypto')

    data = Citero.map(req.body.data).from(req.body.from_format).to(serviceFormat(req.body.to_service))
    filename = "export#{crypto.createHash('md5').update(data).digest('hex')}.#{serviceFormat(req.body.to_service)}"
    fs.writeFile filename, data, (err,info) ->
      if(err)
        return;
      else
        res.redirect(301, "http://www.myendnoteweb.com/?func=directExport&partnerName=Primo&dataIdentifier=1&dataRequestUrl=http://export-citations.herokuapp.com/file/#{filename}")
  else
    res.render "pushTo",
      data: serviceDataDecoration(req.body.to_service,Citero.map(req.body.data).from(req.body.from_format).to(serviceFormat(req.body.to_service))),
      service: fullServiceName(req.body.to_service),
      action: serviceAction(req.body.to_service,req.body.data),
      elementName: serviceElementName(req.body.to_service),
      id: serviceElementName(req.body.to_service)
  return

exports.file = (req, res) ->
  fs = require("fs")
  file = req.params.filename
  res.setHeader('Content-disposition', "attachment; filename=#{req.params.filename}")
  filestream = fs.createReadStream(file)
  filestream.pipe(res)
