# Karma configuration
# Generated on Tue Apr 08 2014 23:59:14 GMT-0400 (EDT)

module.exports = (config) ->
  config.set
    # base path that will be used to resolve all patterns (eg. files, exclude)
    basePath: ''

    # frameworks to use
    # available frameworks: https://npmjs.org/browse/keyword/karma-adapter
    frameworks: ['jasmine', 'requirejs']

    # list of files / patterns to load in the browser
    files: [
      'sea-modules/jquery/dist/jquery.js',
      'sea-modules/jasmine-fixture/dist/jasmine-fixture.min.js',
      'sea-modules/jasmine-jquery/lib/jasmine-jquery.js',
      'sea-modules/underscore/underscore.js',
      'sea-modules/underscore.string/dist/underscore.string.min.js',
      'test-main.js',
      {pattern: 'static/**/src/*.coffee', included: false},
      {pattern: 'test/**/*_spec.coffee', included: false},
      {pattern: 'static/**/src/*.css', included: false, watched: false, served: true}
    ]

    # list of files to exclude
    exclude: []

    # preprocess matching files before serving them to the browser
    # available preprocessors: https://npmjs.org/browse/keyword/karma-preprocessor
    preprocessors:
      '**/*.coffee': ['coffee']

    # test results reporter to use
    # possible values: 'dots', 'progress'
    # available reporters: https://npmjs.org/browse/keyword/karma-reporter
    reporters: ['progress']

    # web server port
    port: 9876

    # enable / disable colors in the output (reporters and logs)
    colors: true

    # level of logging
    # possible values: config.LOG_DISABLE || config.LOG_ERROR || config.LOG_WARN || config.LOG_INFO || config.LOG_DEBUG
    logLevel: config.LOG_INFO

    # enable / disable watching file and executing tests whenever any file changes
    autoWatch: true


    # start these browsers
    # available browser launchers: https://npmjs.org/browse/keyword/karma-launcher
    browsers: ['Chrome']

    # Continuous Integration mode
    # if true, Karma captures browsers, runs the tests and exits
    singleRun: false
