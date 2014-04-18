define ["main/menu", "main/module"], (Menu, Module) ->
  describe "Menu", ->
    tabListLength = Menu.instanceMethods.tabList.length

    beforeEach ->
      affix('.left-off-canvas-menu .off-canvas-list')
      affix('section.main-section')

    it "should have a tabList", ->
      expect(tabListLength).toBeGreaterThan(0)

    it "should build navigation", ->
      expect($('.left-off-canvas-menu .off-canvas-list li')).not.toExist()
      Menu.instanceMethods.buildMenu()
      expect($('.left-off-canvas-menu .off-canvas-list li')).toHaveLength(tabListLength)

    it "should add panels", ->
      expect($('section.main-section .panel')).not.toExist()
      Menu.instanceMethods.buildMenu()
      expect($('section.main-section .panel')).toHaveLength(tabListLength)

    it "should default to the first panel", ->
      Menu.instanceMethods.buildMenu()
      firstPanel = $('section.main-section .panel:first-child')
      otherPanels = $('section.main-section .panel:not(:first)')
      expect(firstPanel).toExist()
      expect(firstPanel).not.toBeHidden()
      expect(otherPanels).toExist()
      expect(otherPanels).toBeHidden()

    it "should change panel", ->
      Menu.instanceMethods.buildMenu()
      firstPanel = $('section.main-section .panel:first-child')
      secondPanel = $('section.main-section .panel:nth-child(2)')
      secondItem = $('.left-off-canvas-menu .off-canvas-list li:nth-child(2)')
      expect(firstPanel).not.toBeHidden()
      expect(secondPanel).toBeHidden()
      secondItem.click()
      expect(firstPanel).toBeHidden()
      expect(secondPanel).not.toBeHidden()

