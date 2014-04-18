define ['require', './module', './menu'], (require, Module, Menu) ->
  class Main extends Module
    @include Menu.instanceMethods

    addCss: ->
      unless $('head link[href*="main.css"]')[0]
        link = document.createElement("link")
        link.type = "text/css"
        link.rel = "stylesheet"
        link.href = require.toUrl('./main.css')
        document.getElementsByTagName("head")[0].appendChild(link)
    constructor: ->
      @addCss()
      @buildMenu()

