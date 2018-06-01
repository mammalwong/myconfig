// Configure CodeMirror Keymap
require([
  'nbextensions/vim_binding/vim_binding',   // depends your installation
], function() {
  CodeMirror.Vim.map("jk", "<Esc>", "insert");
  CodeMirror.Vim.map("_", "0w", "normal");
});
