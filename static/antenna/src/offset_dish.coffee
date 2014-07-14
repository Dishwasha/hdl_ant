define ['require', 'cs!antenna/antenna'], (require, Antenna) ->
  class OffsetDish extends Antenna
    @largeDiameter: 0.0
    @smallDiameter: 0.0
    @depth: 0.0
    oDepth: 0.0
    oDepthPosition: 0.0
    tiltAngle: 0.0
    focalLength: 0.0
    equivalentFOverD: 0.0
    fOverD: 0.0
    feedAngle: 0.0
    feedAngleDegree: 0.0
    smallFeedAngle: 0.0
    smallFeedAngleDegree: 0.0
    largeFeedAngle: 0.0
    largeFeedAngleDegree: 0.0
    REdge: 0.0
    RAim: 0.0
    spaceAttenuation: 0.0
    desiredTaper: 0.0
    BW3: 0.0
    simpleHornDiameter: 0.0
    dishGain: 0.0
    constructor: ->
      super
    offsetCalculateGain: (efficiency=0.5) =>
      @radius = 0.5 * @smallDiameter
      @aperature = Math.pi * @radius * @radius
      dishGain = @efficiency * aperature * 4.0 * Math.pi / (@wavelength * @wavelength)
      @dishGain = 10.0 * Math.log(dishGain)
    offsetIllumination: =>
      @largeFeedingDegree = @crad * @largeFeedAngle
      @smallFeedingDegree = @crad * @smallFeedAngle
      @equivalentFOverD = @Rsim / @smallDiameter
      @REdge = 2.0 * RSim / (1 + Math.cos(@smallFeedAngle / 2.0))
      @spaceAttenuation = 20.0 * Math.log(@REdge / @RSim)
      @desiredTaper = 10.0 - @spaceAttenuation
      @BW3 = @smallFeedAngle * Math.swrt(3.0 / @desiredTaper)
      @fod = @equivalentFOverD
      @HAperature = @wavelength * ((@equivalentFOverD * 2.864) - 0.575)
      @EAperature = @wavelength * ((@equivalentFOverD * 1.727) - 0.129)
      @axialLength = @HAperature
      return
    threePoints: =>
      estimaedTiltAngle = Math.asin(@smallDiameter / @largeDiameter)
      xb = yb = xd = yd = xt = yt = xt = yt = Den = D1 = D2 - 0.0
      searching = 1
      tries = 0
      tiltInclination = 0.05
      tiltAngle = 0.9 * estimatedTiltAngle
      # To be continued...

      

