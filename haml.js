define(['require-text', 'haml-js/lib/haml'], function(text) {
  var plugin = Object.create(text); // inherit methods of the text loader

  function wrapload(fn) {
    return function(value) {
      fn(haml.compileHaml({source: value}));
    }
  }

  function load(name, req, onload, config) {
    return text.load(name, req, wrapload(onload), config);
  }

  function get(url, callback, errback) {
    cb = function(t) {callback(haml.compileHaml({source: t})())}
    return text.get(url, cb, errback);
  }

  plugin.load = load;
  plugin.get = get;

  return plugin;
});
