var dev = window.location.search.indexOf('dev=') != -1;
var main = dev ? '../static/main/src' : 'hdl_ant/main/0.0.1'
var baseUrl = 'sea-modules'

requirejs.config({
  baseUrl: baseUrl,
  paths: {
    "jquery": "jquery/dist/jquery",
    "main": main,
    "underscore": "underscore/underscore",
    "underscore.string": "underscore.string/dist/underscore.string.min",
  }
});

main = dev ? 'main/main' : 'hdl_ant/main/0.0.1/main'
requirejs(['jquery', 'underscore', 'underscore.string', main], function($, _, str, Main) {
  new Main();
});
