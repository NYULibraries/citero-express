Citero = require('../lib/citero').Citero
Formats = require('../lib/citero').Formats
chai = require 'chai'
expect = chai.expect

XerxesXML = require('./helpers/xerxesXml').XerxesXML
for xerxesXml in XerxesXML
  describe "Citero mapping", ->
    it "should convert XerxesXML data to OpenURL", ->
      expect(Citero.map(xerxesXml.data).from(xerxesXml.format).to(Formats.OPENURL)).to.equal(xerxesXml.toOpenUrl)
    it "should convert XerxesXML data to RIS", ->
      expect(Citero.map(xerxesXml.data).from(xerxesXml.format).to(Formats.RIS)).to.equal(xerxesXml.toRis)
    it "should convert XerxesXML data to Refworks Tagged", ->
      expect(Citero.map(xerxesXml.data).from(xerxesXml.format).to(Formats.REFWORKS_TAGGED)).to.equal(xerxesXml.toRefworksTagged)
    it "should convert XerxesXML data to bibtex", ->
      expect(Citero.map(xerxesXml.data).from(xerxesXml.format).to(Formats.BIBTEX)).to.equal(xerxesXml.toBibtex)
    it "should convert XerxesXML data to easybib", ->
      expect(Citero.map(xerxesXml.data).from(xerxesXml.format).to(Formats.EASYBIB)).to.equal(xerxesXml.toEasyBib)
    it "should convert XerxesXML data to csl", ->
      expect(Citero.map(xerxesXml.data).from(xerxesXml.format).to(Formats.CSL)).to.equal(xerxesXml.toCsl)
    it "should convert XerxesXML data to csf", ->
      expect(Citero.map(xerxesXml.data).from(xerxesXml.format).to(Formats.CSF)).to.equal(xerxesXml.toCsf)
