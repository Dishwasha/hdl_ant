var dev = window.location.search.indexOf('dev=') != -1;
var main = dev ? '../static/main/src' : 'hdl_ant/main/0.0.1'
var baseUrl = 'sea-modules'

requirejs.config({
  baseUrl: baseUrl,
  paths: {
    "fastclick": "fastclick/lib/fastclick",
    "foundation": "foundation/js/foundation.min",
    "jquery": "jquery/dist/jquery",
    "main": main,
    "modernizr": "modernizr/modernizr",
    "underscore": "underscore/underscore",
    "underscore.string": "underscore.string/dist/underscore.string.min",
  }
});

main = dev ? 'main/main' : 'hdl_ant/main/0.0.1/main'
requirejs(['jquery', 'underscore', 'underscore.string', 'fastclick', 'modernizr', 'foundation', main], function($, _, str, fastclick, modernizr, foundation, Main) {
  main = new Main();
  $(document).foundation();
});
