define ['require', 'cs!antenna/antenna'], (require, Antenna) ->
  class ConicalHorn extends Antenna
    axialLength: 0
    conicalAperatureDiameter: 0
    circleWgDiameter: 0
    flareAngle: 0
    conicalGain:0
    constructor: ->
      super
    gain: =>
      l = 0.5 * @conicalAperatureDiameter / Math.sin(@flareAngle)
      s = @conicalAperatureDiameter * @conicalAperatureDiameter / (8.0 * @wavelength * l)
      @conicalGain = 20.0 * Math.log(Math.pi * @conicalAperatureDiameter / @wavelength) - @Lc(s)
    simpleGain: =>
      @efficiency = 0.52
      @radius = 0.5 * @conicalAperatureDiameter
      aperatureArea = Math.pi * @radius * @radius
      conicalGain = @efficiency * aperatureArea * 4.0 * Math.pi / (@wavelength * @wavelength)
      @conicalGain = 10.0 * Math.log(conicalGain)

