
#
# * GET home page.
#
exports.index = (req, res) ->
  res.render "index",
    title: "Citero as a Service"

  return
