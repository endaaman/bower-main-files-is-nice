module.exports = (config) ->
    bowerFiles = require 'main-bower-files'

    files = [
        'src/**/*.coffee'
    ]
    files = bowerFiles(includeDev: true).concat files

    config.set
        basePath: ''
        frameworks: ['jasmine']
        files: files
        exclude: []
        preprocessors:
            'src/**/*.coffee': ['coffee']

        reporters: ['progress']
        port: 9876
        colors: true
        logLevel: config.LOG_INFO
        autoWatch: false
        browsers: ['PhantomJS']
        singleRun: true



