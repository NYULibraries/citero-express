Citero = require('../lib/citero').Citero
Formats = require('../lib/citero').Formats
chai = require 'chai'
expect = chai.expect

RIS = require('./helpers/ris').RIS
for ris in RIS
  describe "Citero mapping", ->
    it "should convert RIS data to OpenURL", ->
      expect(Citero.map(ris.data).from(ris.format).to(Formats.OPENURL)).to.equal(ris.toOpenUrl)
    it "should convert RIS data to RIS", ->
      expect(Citero.map(ris.data).from(ris.format).to(Formats.RIS)).to.equal(ris.toRis)
    it "should convert RIS data to Refworks Tagged", ->
      expect(Citero.map(ris.data).from(ris.format).to(Formats.REFWORKS_TAGGED)).to.equal(ris.toRefworksTagged)
    it "should convert RIS data to bibtex", ->
      expect(Citero.map(ris.data).from(ris.format).to(Formats.BIBTEX)).to.equal(ris.toBibtex)
    it "should convert RIS data to easybib", ->
      expect(Citero.map(ris.data).from(ris.format).to(Formats.EASYBIB)).to.equal(ris.toEasyBib)
    it "should convert RIS data to csl", ->
      expect(Citero.map(ris.data).from(ris.format).to(Formats.CSL)).to.equal(ris.toCsl)
    it "should convert RIS data to csf", ->
      expect(Citero.map(ris.data).from(ris.format).to(Formats.CSF)).to.equal(ris.toCsf)
