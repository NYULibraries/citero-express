Citero = require('../lib/citero').Citero
Formats = require('../lib/citero').Formats
chai = require 'chai'
expect = chai.expect

RefworksTagged = require('./helpers/refworksTagged').RefworksTagged
for refWorksTagged in RefworksTagged
  describe "Citero mapping", ->
    it "should convert RefworksTagged data to OpenURL", ->
      expect(Citero.map(refWorksTagged.data).from(refWorksTagged.format).to(Formats.OPENURL)).to.equal(refWorksTagged.toOpenUrl)
    it "should convert RefworksTagged data to RIS", ->
      expect(Citero.map(refWorksTagged.data).from(refWorksTagged.format).to(Formats.RIS)).to.equal(refWorksTagged.toRis)
    it "should convert RefworksTagged data to Refworks Tagged", ->
      expect(Citero.map(refWorksTagged.data).from(refWorksTagged.format).to(Formats.REFWORKS_TAGGED)).to.equal(refWorksTagged.toRefworksTagged)
    it "should convert RefworksTagged data to bibtex", ->
      expect(Citero.map(refWorksTagged.data).from(refWorksTagged.format).to(Formats.BIBTEX)).to.equal(refWorksTagged.toBibtex)
    it "should convert RefworksTagged data to easybib", ->
      expect(Citero.map(refWorksTagged.data).from(refWorksTagged.format).to(Formats.EASYBIB)).to.equal(refWorksTagged.toEasyBib)
    it "should convert RefworksTagged data to csl", ->
      expect(Citero.map(refWorksTagged.data).from(refWorksTagged.format).to(Formats.CSL)).to.equal(refWorksTagged.toCsl)
    it "should convert RefworksTagged data to csf", ->
      expect(Citero.map(refWorksTagged.data).from(refWorksTagged.format).to(Formats.CSF)).to.equal(refWorksTagged.toCsf)
