java = require("java");
java.classpath.push("#{__dirname}/citero.jar");

class Citero
  constructor: (data) ->
    @cite = java.import("edu.nyu.library.citero.Citero")
    @cite = @cite.mapSync(data)
    this

  @map: (data) ->
    new this(data)

  from: (format) ->
    @cite.fromSync(format)
    this

  to: (format) ->
	  @cite.toSync(format)

root = exports ? window
root.Citero = Citero
root.Formats = require("./formats").Formats
