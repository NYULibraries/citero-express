Citero = require('../lib/citero').Citero
Formats = require('../lib/citero').Formats
chai = require 'chai'
expect = chai.expect

PNX = require('./helpers/pnx').PNX
for pnx in PNX
  describe "Citero mapping", ->
    it "should convert PNX data to OpenURL", ->
      expect(Citero.map(pnx.data).from(pnx.format).to(Formats.OPENURL)).to.equal(pnx.toOpenUrl)
    it "should convert PNX data to RIS", ->
      expect(Citero.map(pnx.data).from(pnx.format).to(Formats.RIS)).to.equal(pnx.toRis)
    it "should convert PNX data to Refworks Tagged", ->
      expect(Citero.map(pnx.data).from(pnx.format).to(Formats.REFWORKS_TAGGED)).to.equal(pnx.toRefworksTagged)
    it "should convert PNX data to bibtex", ->
      expect(Citero.map(pnx.data).from(pnx.format).to(Formats.BIBTEX)).to.equal(pnx.toBibtex)
    it "should convert PNX data to easybib", ->
      expect(Citero.map(pnx.data).from(pnx.format).to(Formats.EASYBIB)).to.equal(pnx.toEasyBib)
    it "should convert PNX data to csl", ->
      expect(Citero.map(pnx.data).from(pnx.format).to(Formats.CSL)).to.equal(pnx.toCsl)
    it "should convert PNX data to csf", ->
      expect(Citero.map(pnx.data).from(pnx.format).to(Formats.CSF)).to.equal(pnx.toCsf)
