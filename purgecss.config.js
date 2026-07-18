module.exports = {
  content: ["_site/**/*.html", "_site/**/*.js"],
  css: ["_site/assets/css/*.css"],
  output: "_site/assets/css/",
  skippedContentGlobs: ["_site/assets/**/*.html"],
  safelist: [
    // medium-zoom injects these classes at runtime.
    "medium-zoom-overlay",
    "medium-zoom-image--opened",
  ],
};
