var dev = window.location.search.indexOf('dev=') != -1;
var main = dev ? '../static/main/src' : 'hdl_ant/main/0.0.1'
var antenna = dev ? '../static/antenna/src' : 'hdl_ant/antenna/0.0.1'
var baseUrl = 'sea-modules'

requirejs.config({
  baseUrl: baseUrl,
  packages: [{
    name: 'cs',
    location: 'require-cs',
    main: 'cs'
  },{
    name: 'coffee-script',
    location: 'require-cs',
    main: 'coffee-script'
  },{
    name: 'text',
    location: '..',
    main: 'haml'
  },{
    name: 'hgn',
    location: 'require-hogan',
    main: 'hgn'
  }],
  paths: {
    "antenna": antenna,
    "fastclick": "fastclick/lib/fastclick",
    "foundation": "foundation/js/foundation.min",
    "hamljs": "haml-js/lib/haml.min",
    "hogan": "require-hogan/hogan",
    "text": "../haml",
    "main": main,
    "modernizr": "modernizr/modernizr",
    "require-cs": "require-cs/cs",
    "require-text": "require-text/text",
    "underscore": "underscore/underscore",
    "underscore.string": "underscore.string/dist/underscore.string.min"
  }
});

main = dev ? 'cs!main/main' : 'main/main'
requirejs([
  'underscore',
  'underscore.string',
  'fastclick',
  'modernizr',
  'foundation',
  main,
],function(
  _,
  str,
  fastclick,
  modernizr,
  foundation,
  Main) {
    main = new Main();
    $(document).foundation();
  }
);
