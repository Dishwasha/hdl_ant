define ['require', 'cs!antenna/antenna'], (require, Antenna) ->
  class Lens extends Antenna
    BWEhorn: 0.0
    compensate: 0
    gainLens: 0.0
    index 0
    N: 0.0
    lensDiameter: 0.0
    lensFocalLength: 0.0
    lensToHorn: 0.0
    spacing; 0.0
    widthIncrease: 0.0
    calculate: =>
      @N = Integer(@lensDiameter / (2.0 * @spacing))
      if (@lensDiameter - (2.0 * @N * @spacing) > (@spacing * 0.5)
        @N+=1
      lensDiameter = 2.0 * @N * @spacing
      gainLens = 10.0 * Math.log(@gainLens)

      @index = Math.sqrt(1.0 - (@wavelengh / (2.0 * @spacing)) * (@wavelength / (2.0 * @spacing)))
      @BWEhorn = (56.0 / (@EAperature / @wavelength)) / @crad
      @lensFocalLength = @lensDiameter / (2.0 * Math.tan(@BWEhorn / 2.0))
      return

    constructor: ->
      super

