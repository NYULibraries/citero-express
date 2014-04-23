Citero = require('../lib/citero').Citero
Formats = require('../lib/citero').Formats
chai = require 'chai'
expect = chai.expect

OpenURL = require('./helpers/openURL').OpenURL
for openUrl in OpenURL
  describe "Citero mapping", ->
    it "should convert OpenURL data to OpenURL", ->
      expect(Citero.map(openUrl.data).from(openUrl.format).to(Formats.OPENURL)).to.equal(openUrl.toOpenUrl)
    it "should convert OpenURL data to RIS", ->
      expect(Citero.map(openUrl.data).from(openUrl.format).to(Formats.RIS)).to.equal(openUrl.toRis)
    it "should convert OpenURL data to Refworks Tagged", ->
      expect(Citero.map(openUrl.data).from(openUrl.format).to(Formats.REFWORKS_TAGGED)).to.equal(openUrl.toRefworksTagged)
    it "should convert OpenURL data to bibtex", ->
      expect(Citero.map(openUrl.data).from(openUrl.format).to(Formats.BIBTEX)).to.equal(openUrl.toBibtex)
    it "should convert OpenURL data to easybib", ->
      expect(Citero.map(openUrl.data).from(openUrl.format).to(Formats.EASYBIB)).to.equal(openUrl.toEasyBib)
    it "should convert OpenURL data to csl", ->
      expect(Citero.map(openUrl.data).from(openUrl.format).to(Formats.CSL)).to.equal(openUrl.toCsl)
    it "should convert OpenURL data to csf", ->
      expect(Citero.map(openUrl.data).from(openUrl.format).to(Formats.CSF)).to.equal(openUrl.toCsf)
