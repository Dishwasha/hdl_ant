define [
  'hgn!main/templates/horn-design.html.haml',
  'hgn!main/templates/horn-calculations.html.haml',
  'hgn!main/templates/dish-calculations.html.haml',
  'hgn!main/templates/lens.html.haml',
  'hgn!main/templates/range-design.html.haml',
  'hgn!main/templates/measurement-corrections.html.haml',
  'hgn!main/templates/info.html.haml',
  'hgn!main/templates/printing.html.haml',
  'hgn!main/templates/offset-calculations.html.haml',
  'hgn!main/templates/feed-horn.html.haml',
  'hgn!main/templates/sky-ground-noise.html.haml',
  'hgn!main/templates/conical-horn-antenna-calculations.html.haml',
  'hgn!main/templates/conical-horn.html.haml',
  'hgn!main/templates/trial-curve.html.haml',
  'hgn!main/templates/dual-horn-calculations.html.haml',
], (hornDesign, hornCalculations, dishCalculations, lens, rangeDesign,measurementCorrections,
  info, printing, offsetCalculations, feedHorn, skyGroundNoise, conicalHornAntennaCalculations,
  conicalHorn, trialCurve, dualHornCalculations) ->
  class Menu
    @classMethods = {}
    @instanceMethods =
      buildMenu: ->
        @canvasList = $('.left-off-canvas-menu .off-canvas-list')
        @mainSection = $('section.main-section')
        _.each @tabList, $.proxy(@buildTab, @)
        $(@canvasList.find('li')).click @panelClickEvent
      buildPanel: (item) ->
        panel = $("<div class=\"panel\" id=\"#{item.anchor}\"></div>")
        panel.append(item.template(item.scope))
      buildTab: (item, index) ->
        label = $("<li for=\"#{item.anchor}\"><a href=\"#\">#{item.label}</a></li>")
        @canvasList.append(label)
        panel = @buildPanel(item)
        panel.hide() if index > 0
        @mainSection.append(panel)
      panelClickEvent: (panel) ->
        anchor = $(@).attr('for')
        $('.panel').hide()
        $("##{anchor}").show()
      tabList: [
        {label: 'Horn antenna design and template', anchor: 'horn-design', template: hornDesign, scope: {}},
        {label: 'Existing horn antenna calculations', anchor: 'horn-calculations', template: hornCalculations, scope: {}},
        {label: 'Dish antenna calculations and template', anchor: 'dish-calculations', template: dishCalculations, scope: {}},
        {label: 'Lens antenna design', anchor: 'lens', template: lens, scope: {}},
        {label: 'Range design for antenna measurement', anchor: 'range-design', template: rangeDesign, scope: {}},
        {label: 'Measurement corrections for antennas', anchor: 'measurement-corrections', template: measurementCorrections, scope: {}},
        {label: 'Information about HDL_ANT v3 program', anchor: 'info', template: info, scope: {}},
        {label: 'PostScript printing information', anchor: 'printing', template: printing, scope: {}},
        {label: 'Offset dish calculations', anchor: 'offset-calculations', template: offsetCalculations, scope: {}},
        {label: 'Feed horn design  (rectangular - from G3RPE curves)', anchor: 'feed-horn', template: feedHorn, scope: {}},
        {label: 'Noise Figure from sky and ground noise', anchor: 'sky-ground-noise', template: skyGroundNoise, scope: {}},
        {label: 'Conical horn antenna calculations and template', anchor: 'conical-horn-antenna-calculations', template: conicalHornAntennaCalculations, scope: {}},
        {label: 'Generate an optimal conical horn design and template', anchor: 'conical-horn', template: conicalHorn, scope: {}},
        {label: 'Trial curve fitting points for offset dish', anchor: 'trial-curve', template: trialCurve, scope: {}},
        {label: 'W2IMU dual-mode feedhorn calculations', anchor: 'dual-horn-calculations', template: dualHornCalculations, scope: {}}
      ]

