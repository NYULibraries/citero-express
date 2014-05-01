citeroMap = (data, from, to) ->
  Citero = require("citero").Citero
  console.log from
  mapped = Citero.map(data)
  console.log mapped
  mappedFrom = mapped.from(from)
  console.log mappedFrom
  mappedTo = mappedFrom.to(to)
  console.log mappedTo
  mappedTo

filenameExtension = (to) ->
  switch to.toLowerCase()
    when "ris"
      "ris"
    when "openurl"
      "url"
    when "pnx"
      "pnx"
    when "easybib"
      "json"
    when "csf"
      "csf"
    when "csl"
      "csl"
    when "bibtex"
      "bib"
    else
      "ris"

exports.post = (req, res) ->
  temp = require("temp")
  fs = require("fs")
  util = require("util")
  exec = require("child_process").exec
  temp.track()
  temp.open {prefix: "export", suffix: ".#{(filenameExtension(req.body.to))}"}, (err, info) ->
    console.log "From format: #{req.body.from_format}"
    console.log "To format: #{req.body.to_format}"
    fs.write info.fd, citeroMap(req.body.data, req.body.from_format, req.body.to_format)
    fs.close info.fd, (err) ->
      exec "grep foo '" + info.path + "' | wc -l", (err, stdout) ->
        util.puts stdout.trim()
        return

      return

    res.set "Content-Disposition": "attachment; filename='export.#{(filenameExtension(req.body.to))}'"
    res.download info.path
    return

  temp.cleanup()
  return
