define ['require', 'cs!antenna/antenna'], (require, Antenna) ->
  class Dish extends Antenna
    depth: 0.0
    diameter: 0.0
    dishGain: 0.0
    feedAngle: 0.0
    feedAngleDegree: 0.0
    focalLength 0.0
    fOverD: 0.0
    REdge: 0.0
    spaceAttenuation: 0
    desiredTaper: 0.0
    BW3: 0.0
    simpleHornDiameter: 0.0

    calculateGain: =>
      efficiency = 0.5
      @radius = 0.5 * @diameter
      @aperature = Math.pi * @radius * @radius
      dishGain = efficiency * @aperature * 4.0 * Math.pi / (@wavelength * @wavelength)
      @dishGain = 10.0 * Math.log(dishGain)
    constructor: ->
      super
    illumination: =>
      @feedAngle = 2 * Math.atan(1.0((2.0 * @fOverD) - (1.0 / (8.0 * @fOverD))))
      @feedAngleDegree: @crad * @feedAngle
      @REdge = 2.0 * @focalLength / (1 + Math.cos(@feedAngle / 2.0))
      @spaceAttenuation = 20.0 * Math.log(@REdge / @focalLength)
      @desiredTaper = 10.0 - @spaceAttenuation
      @BW3 = @feedAngle * Math.sqrt(3.0 / @desiredTaper)
      @simpleHornDiameter = 66.0 / (@BW3 * @crad)

