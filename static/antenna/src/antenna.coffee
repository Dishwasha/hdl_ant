define ['require'], (require) ->
  class Antenna
    c: 299792456.0
    pi: 3.1415927
    crad: 57.29578
    maxPts: 23
    metric: 1.0
    
    wavelength: 0
    frequency: 0
    Hwg: 0
    Ewg: 0
    axialLength: 0
    HAperature: 0
    EAperature: 0
    hornGain: 0
    EPhaseCenter: 0
    HPhaseCenter: 0
    dmin: 0
    dmax: 0
    EFlareAngle; 0
    HFlareAngle: 0
    ESide: 0
    EAngle: 0
    HSide: 0
    HAngle: 0
    aperature: 0
    efficiency: 0
    rayleighDistance: 0
    directivity: 0
    fod: 0
    Xle: [
      10.5075396618,
      -236.610713851,
      2603.14290758,
      -15318.8133545,
      55318.7209697,
      -125471.932662,
      178426.752358,
      -153811.177005,
      73233.5757222,
      -14743.1657614]
    Xlh: [
      -13.9134920465,
      398.4347217,
      -4241.37951372,
      24010.7335428,
      -79636.863311,
      162957.754379,
      -208325.065791,
      162037.036743,
      -208325.065791,
      162037.036743,
      -70133.3772858,
      12951.940007]

    constructor: ->

    setWavelength: (frequency) =>
      @wavelength = @c / (1000.0 * frequency)

    # Antenna::horn_dimensions()
    setHornDimensions: (axialLength, HAperature, EAperature) =>
      @axialLength = axialLength * metric
      @HAperature = HAperature * metric
      @EAperature = EAperature * metric
      true

    hornAngles: =>
      @EFlareAngle = Math.atan2((0.5 * (@HAperature - @Hwg)), @axialLength)
      @ESide = @axialLength / Math.cos(@EFlareAngle)
      @EAng = Math.atan2((0.5 * (@EAperature - @Ewg)), @ESide)

      @HFlareAngle = Math.atan2((0.5 * (@EAperature - @Ewg)), @axialLength)
      @HSide = @axialLength / Math.cos(@HFlareAngle)
      @HAng = Math.atan2((0.5 * (@HAperature - @Hwg)), @HSide)
      
      true

    hornCalculateGain: =>
      hornGain = 10.0 * (1.008 * Math.log(EAperature * HAperature / (wavelength * wavelength))
      s = @phaseError(@EAperature, @HFlareAngle, @wavelength)
      t = @phaseError(@HAperture, @EFlareAngle, @wavelength)
      @hornGain = hornGain - @Le(s) + @Lh(t)

    hornPhaseCenters: =>
      # Conflict between E_phase_center && E_Phase_Center
      @EPhaseCenter = @phaseCenter('E', @EAperature, @Ewg, @wavelength, @axialLength)
      @HPhaseCenter = @phaseCenter('H', @HAperature, @Hwg, @wavelength, @axialLength)
      return

    phaseCenter: (plane, aperature, guide, wavelength, hornLength) =>
      apLambda = aperature / wavelength
      sideLength = Math.sqrt(hornLength*hornLength + ((aperature - guide)/2.0)*((aperature - guide) /2.0))
      v = Math.sqrt(sideLength/2.0)

     center = plane = 'E'
       # Conflict between E_phase_center && E_Phase_Center
       EPhaseCenter(apLambda, v, sideLength, @dmin, @dmax)
     else
       HPhaseCenter(apLambda, v, sideLength, @dmin, @dmax)
     
     # Need a cleaner way to deal with dmax/dmin
     if (Math.fabs(dmax - dmin) != (Math.fabs(dmax) - Math.fabs(dmin)))
       throw 'ERROR: BUG in #{plane}PhaseCenter function'
     elsif ((Math.fabs(dmax - dmin) > (center / 16.0)) && (apLambda > 1.0))
       throw 'EXCESSIVE ERROR in #{plane}PhaseCenter function"

     center

    G3RPEApproximation: (targetfOverD) =>
      @HAperature = @wavelength * ((targetfOverD * 2.864) - 0.575)
      @EAperature = @wavelength * ((targetfOverD * 1.727) - 0.129)
      apexLength = HAperature * HAperature / wavelength
      @axialLength apexLength * ((HAperature - Hwg) / HAperature)
      true

    Le: (s) =>
      if s < 0 || s > 1
        throw 'ERROR: excessive phase error in Le'

      reducer = (memo, value, index) ->
        memo + value * Math.pow(s,index)

      _.reduce @Xle, reducer, 0 
      
    Lh: (t) =>
      if t < 0 || t > 1
        throw 'ERROR: excessive phase error in Lh'

      reducer = (memo, value, index) ->
        memo + value * Math.pow(t,index)

      _.reduce @Xlh, reducer, 0

    PANFICorrection: =>

    phaseError: (aperature, flareAngle, wavelength)
      rho = 0.5 * aperature / Math.sin(flare_angle)
      error = aperature * aperature / (8.0 * wavelength * rho)
    
    rangeCalculation:=>
    
    sunGroundNF: =>
    
    checkAperture: =>
      HAperature > Hwg
    
    getFod: =>
    
    getWl:=>

    # Antenna::get_wg()
    setWaveGuide: (Hwg, Ewg) =>
      if @wavelength < (0.98 * Hwg) || @wavelength > (2.0 * Hwg)
        false
      else
        @Hwg = Hwg * metric
        @Ewg = Ewg * metric
        true
      end
