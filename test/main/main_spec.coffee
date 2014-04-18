define ["main/main", "main/menu", "main/module"], (Main, Menu, Module) ->
  describe "Main", ->
    it "should extend Module", ->
      expect(Main.__super__).toEqual(Module.prototype)
    it "should include Menu.instanceMethods", ->
      for key in Menu.instanceMethods
        expect(Main[key]).toBeDefined()
        expect(Main[key]).toEqual(Menu.instanceMethods[key])

    describe "constructor", ->
      it "should call addCss", ->
        spyOn(Main.prototype, 'addCss')
        new Main()
        expect(Main.prototype.addCss).toHaveBeenCalled()
      it "should call buildMenu", ->
        spyOn(Main.prototype, 'buildMenu')
        new Main()
        expect(Main.prototype.buildMenu).toHaveBeenCalled()

    describe "addCss", ->
      beforeEach ->
        $('head link[href*="main.css"]').remove()
        expect($('head link[href*="main.css"]')).not.toExist()

      it "should load main.css", (done) ->
        checkCSS = ->
          if $('head link[href*="main.css"]')[0]
            done()
            clearInterval()
        window.setInterval(checkCSS, 500)
        new Main()
        expect($('head link[href*="main.css"]')).toExist()

