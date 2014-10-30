gulp        = require 'gulp'
connect     = require 'gulp-connect'
stylus      = require 'gulp-stylus'
prefix      = require 'gulp-autoprefixer'
cinnabar    = require './cinnabar'

gulp.task 'stylesheets', () ->
  gulp.src './demo/demo.styl'
  .pipe stylus
    use: [cinnabar()]
  .pipe prefix("last 2 versions", "> 1%", "ie 9", "ie 8", { cascade: true })
  .pipe gulp.dest('./demo')
  .pipe connect.reload()

gulp.task 'webserver', () ->
  connect.server
    root: 'demo'
    port: 4444
    livereload:
      port: 4443

gulp.task 'watch', () ->
  gulp.watch 'demo/*.styl', ['stylesheets']
  gulp.watch 'cinnabar/*.styl', ['stylesheets']

gulp.task 'start', ['stylesheets', 'webserver', 'watch']
