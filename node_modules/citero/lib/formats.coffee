java = require("java");
java.classpath.push("#{__dirname}/citero.jar");
  
Formats = java.import("edu.nyu.library.citero.Formats")

root = exports ? window
root.Formats = Formats  
