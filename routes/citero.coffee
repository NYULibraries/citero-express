from_format = (from) ->
  Formats = require("citero").Formats
  switch from
    when "ris"
      Formats.RIS
    when "openurl"
      Formats.OPENURL
    when "pnx"
      Formats.PNX
    when "xerxes_xml"
      Formats.XERXES_XML
    when "csf"
      Formats.CSF
    when "refworks_tagged"
      Formats.REFWORKS_TAGGED

to_format = (to) ->
  Formats = require("citero").Formats
  switch to
    when "ris"
      Formats.RIS
    when "openurl"
      Formats.OPENURL
    when "pnx"
      Formats.PNX
    when "easybib"
      Formats.EASYBIB
    when "csf"
      Formats.CSF
    when "csl"
      Formats.CSL
    when "bibtex"
      Formats.BIBTEX

citeroMap = (data, from, to) ->
  Citero = require("citero").Citero
  console.log from_format(from)
  Citero.map(data).from(from_format(from)).to to_format(to)

filenameExtension = (to) ->
  switch to
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

exports.post = (req, res) ->
  temp = require("temp")
  fs = require("fs")
  util = require("util")
  exec = require("child_process").exec
  temp.track()
  temp.open "export", (err, info) ->
    fs.write info.fd, citeroMap(req.body.data, req.body.from, req.body.to)
    fs.close info.fd, (err) ->
      exec "grep foo '" + info.path + "' | wc -l", (err, stdout) ->
        util.puts stdout.trim()
        return

      return

    res.set "Content-Disposition": "attachment; filename='export." + (filenameExtension(req.body.to)) + "'"
    res.download info.path
    return

  temp.cleanup()
  return
