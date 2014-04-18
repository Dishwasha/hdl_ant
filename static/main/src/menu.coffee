define ->
  class Menu
    @classMethods = {}
    @instanceMethods =
      buildMenu: ->
        @canvasList = $('.left-off-canvas-menu .off-canvas-list')
        @mainSection = $('section.main-section')
        _.each @tabList, (item, index) =>
          label = $("<li for=\"#{item.anchor}\"><a href=\"#\">#{item.label}</a></li>")
          @canvasList.append(label)
          panel = $("<div class=\"panel\" id=\"#{item.anchor}\">#{item.label}</div>")
          panel.hide() if index > 0
          @mainSection.append(panel)
        $(@canvasList.find('li')).click (panel) ->
          anchor = $(@).attr('for')
          $('.panel').hide()
          $("##{anchor}").show()
      tabList: [
        {label: 'Horn antenna design and template', anchor: 'horn-design'},
        {label: 'Existing horn antenna calculations', anchor: 'horn-calculations'},
        {label: 'Dish antenna calculations and template', anchor: 'dish-calculations'},
        {label: 'Lens antenna design', anchor: 'lens'},
        {label: 'Range design for antenna measurement', anchor: 'range-design'},
        {label: 'Measurement corrections for antennas', anchor: 'measurement-corrections'},
        {label: 'Information about HDL_ANT v3 program', anchor: 'info'},
        {label: 'PostScript printing information', anchor: 'printing'},
        {label: 'Offset dish calculations', anchor: 'offset-calculations'},
        {label: 'Feed horn design  (rectangular - from G3RPE curves)', anchor: 'feed-horn'},
        {label: 'Noise Figure from sky and ground noise', anchor: 'sky-ground-noise'},
        {label: 'Conical horn antenna calculations and template', anchor: 'conical-horn-antenna-calculations'},
        {label: 'Generate an optimal conical horn design and template', anchor: 'conical-horn'},
        {label: 'Trial curve fitting points for offset dish', anchor: 'trial-curve'},
        {label: 'W2IMU dual-mode feedhorn calculations', anchor: 'dual-horn-calculations'}
      ]

