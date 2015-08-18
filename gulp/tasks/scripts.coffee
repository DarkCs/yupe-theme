gulp = require 'gulp'
plumber = require 'gulp-plumber'
gutil = require 'gulp-util'
gulpif = require 'gulp-if'
concat = require 'gulp-concat'
uglify = require 'gulp-uglify'
errorHandler = require '../utils/errorHandler'
paths = require '../paths'

gulp.task 'scripts', ->
  gulp.src [
    'components/jquery/dist/jquery.min.js'
    'components/svg4everybody/svg4everybody.min.js'
    'components/slick/slick/slick.min.js'
    'components/jQuery-Collapse/src/jquery.collapse.js'
    'components/jQuery-Collapse/src/jquery.collapse_storage.js'
    'components/select2/select2.js'
    'components/fancybox/lib/jquery.mousewheel-3.0.6.pack.js'
    'components/fancybox/source/jquery.fancybox.js'
    'components/fancybox/helpers/*.js'
    'app/scripts/views/**/*.js'
    'app/scripts/common.js'
  ]
  .pipe plumber errorHandler: errorHandler
  .pipe concat 'common.min.js'
  .pipe gulpif !gutil.env.debug, uglify()
  .pipe gulp.dest paths.scripts
