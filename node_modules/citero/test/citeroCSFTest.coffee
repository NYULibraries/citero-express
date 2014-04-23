root = require('../lib/citero')
Citero = root.Citero
Formats = root.Formats
chai = require 'chai'
expect = chai.expect

CSF = require('./helpers/csf').CSF
for csf in CSF
  describe "Citero mapping", ->
    it "should convert CSF data to OpenURL", ->
      expect(Citero.map(csf.data).from(csf.format).to(Formats.OPENURL)).to.equal(csf.toOpenUrl)
    it "should convert CSF data to RIS", ->
      expect(Citero.map(csf.data).from(csf.format).to(Formats.RIS)).to.equal(csf.toRis)
    it "should convert CSF data to Refworks Tagged", ->
      expect(Citero.map(csf.data).from(csf.format).to(Formats.REFWORKS_TAGGED)).to.equal(csf.toRefworksTagged)
    it "should convert CSF data to bibtex", ->
      expect(Citero.map(csf.data).from(csf.format).to(Formats.BIBTEX)).to.equal(csf.toBibtex)
    it "should convert CSF data to easybib", ->
      expect(Citero.map(csf.data).from(csf.format).to(Formats.EASYBIB)).to.equal(csf.toEasyBib)
    it "should convert CSF data to csl", ->
      expect(Citero.map(csf.data).from(csf.format).to(Formats.CSL)).to.equal(csf.toCsl)
    it "should convert CSF data to csf", ->
      expect(Citero.map(csf.data).from(csf.format).to(Formats.CSF)).to.equal(csf.toCsf)
