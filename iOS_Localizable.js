
var Localize = require("./localize/index.js");

var transformer = Localize.fromGoogleSpreadsheet("1P-Ncuz1iAcrPU6UzwDl44wiDm8mjUxo18m7lbjIDDLs", '*');
transformer.setKeyCol('KEY');
transformer.save("LocalString/en.lproj/Localizable.strings", { valueCol: "EN", format: "ios" });
transformer.save("LocalString/ja.lproj/Localizable.strings", { valueCol: "JA", format: "ios" });
transformer.save("LocalString/zh-Hans.lproj/Localizable.strings", { valueCol: "CN", format: "ios" });
