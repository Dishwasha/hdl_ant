define ['require', 'cs!antenna/antenna'], (require, Antenna) ->
  class Horn extends Antenna
    gainLookup: [
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
      0.080,
      0.24,
      0.4,
      0.6,
      0.88,
      1.25,
      1.7,
      2.25,
      3.0,
      4.0,
      5.2,
      6.7,
      8.7,
      11.2,
      14.3,
      18.3]
    simpleGain: 0
    constructor: ->
      super
    setSimpleGain: =>
      simpleGain = 4.5 * (@HAperature / @wavelength) * (@EAperature / @wavelength)
      @simpleGain = 10.0 * Math.log(simplegain) * 2.14


