const importImport = require("postcss-import");
const flexBugsFixesImport = require("postcss-flexbugs-fixes");
const presetEnvImport = require("postcss-preset-env");

module.exports = {
  plugins: [
    importImport,
    flexBugsFixesImport,
    presetEnvImport({
      autoprefixer: {
        flexbox: "no-2009",
      },
      stage: 3,
      features: {
        "nesting-rules": true,
      },
    }),
  ],
};
