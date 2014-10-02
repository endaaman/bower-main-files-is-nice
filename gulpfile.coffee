g = require 'gulp'
jade = require 'gulp-jade'
inject = require 'gulp-inject'
concat = require 'gulp-concat'
coffee = require 'gulp-coffee'
del = require 'del'

conf =
    src: 'src'
    dest: 'public'
    prod: false
    bowerDir: 'public/bower_components'


g.task 'build:bower', ->
    if conf.prod
        g.src bowerFiles()
        .pipe concat('_vendor.js')
        .pipe g.dest("#{conf.dest}/")

bowerFiles = require 'main-bower-files'

g.task 'clean', ->
    del [
        "#{conf.dest}/**/*"
        "!#{conf.bowerDir}"
        "!#{conf.bowerDir}/**/*"
    ]

g.task 'coffee', ->
    g.src "#{conf.src}/*.coffee"
    .pipe coffee()
    .pipe g.dest "#{conf.dest}/"


g.task 'index', ['build:bower', 'coffee'], ->
    ignores = ['public/', 'client/']

    t = g.src "#{conf.src}/index.jade"
    .pipe jade pretty: not conf.prod
    if not conf.prod
        t.pipe inject(
            g.src(bowerFiles(),
                    base: conf.bowerDir
                    read: false),
                ignorePath: ignores
                name: 'bower'
        )
    t.pipe inject(
        g.src("#{conf.dest}/*.js", read: false),
            ignorePath: ignores
    )

    t.pipe g.dest "#{conf.dest}/"


g.task 'build', ['index']

g.task 'prod', ->
    conf.prod = true

g.task 'default', ['build']
