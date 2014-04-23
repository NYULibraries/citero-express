Formats = require('../../lib/citero').Formats

RIS = [
  {
    data: "TY  -  JOUR\nAU  -  Shannon, Claude E.\nER  -\n\n"
    format: Formats.RIS
    toOpenUrl: "rft.ulr_ver=Z39.88-2004&rft.ctx_ver=Z39.88-2004&rft.rfr_id=info:sid/libraries.nyu.edu:citero&rft_val_fmlt=info:ofi/fmt:kev:mtx:journal&rft.genre=article&rft.au=Shannon%2C+Claude+E."
    toRis: "TY  -  JOUR\nAU  -  Shannon, Claude E.\nER  -\n\n"
    toRefworksTagged: "RT Journal Article\nA1 Shannon, Claude E.\nER \n \n"
    toBibtex: "@article{shannon_????,\n\tauthor = {Shannon, Claude E.}\n}"
    toEasyBib: "{\"source\":\"journal\",\"journal\":{\"title\":null},\"pubtype\":{\"main\":\"pubjournal\"},\"pubjournal\":{},\"contributors\":[{\"function\":\"author\",\"first\":\"Claude\",\"middle\":\"E.\",\"last\":\"Shannon\"}]}"
    toCsl: "{\"ITEM-1\":{\"id\":\"ITEM-1\",\"author\":[{\"family\":\"Shannon\",\"given\":\"Claude\"}],\"type\":\"article-journal\"}}"
    toCsf: "itemType:journalArticle\nauthor:Shannon\\, Claude E\\.\nimportedFrom:RIS\n"
  },
  {
    data: "TY  -  JOUR\nAU  -  Shannon, Claude E.\nER  -\n\n"
    format: Formats.RIS
    toOpenUrl: "rft.ulr_ver=Z39.88-2004&rft.ctx_ver=Z39.88-2004&rft.rfr_id=info:sid/libraries.nyu.edu:citero&rft_val_fmlt=info:ofi/fmt:kev:mtx:journal&rft.genre=article&rft.au=Shannon%2C+Claude+E."
    toRis: "TY  -  JOUR\nAU  -  Shannon, Claude E.\nER  -\n\n"
    toRefworksTagged: "RT Journal Article\nA1 Shannon, Claude E.\nER \n \n"
    toBibtex: "@article{shannon_????,\n\tauthor = {Shannon, Claude E.}\n}"
    toEasyBib: "{\"source\":\"journal\",\"journal\":{\"title\":null},\"pubtype\":{\"main\":\"pubjournal\"},\"pubjournal\":{},\"contributors\":[{\"function\":\"author\",\"first\":\"Claude\",\"middle\":\"E.\",\"last\":\"Shannon\"}]}"
    toCsl: "{\"ITEM-1\":{\"id\":\"ITEM-1\",\"author\":[{\"family\":\"Shannon\",\"given\":\"Claude\"}],\"type\":\"article-journal\"}}"
    toCsf: "itemType:journalArticle\nauthor:Shannon\\, Claude E\\.\nimportedFrom:RIS\n"
  }
]
root = exports ? window
root.RIS = RIS  
