
#
# * GET home page.
#
exports.index = (req, res) ->
  res.render "index",
    title: "Export Citations as a service"

  return
