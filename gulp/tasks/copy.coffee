gulp = require 'gulp'
changed = require 'gulp-changed'
filter = require 'gulp-filter'
gutil = require 'gulp-util'
gulpif = require 'gulp-if'
paths = require '../paths'


gulp.task 'copy:images', ->
  gulp.src [
      '**/*.{png,jpg,gif,svg}'
      '!sprite/**/*'
    ],
    cwd: paths.appImages
  .pipe gulp.dest paths.images

gulp.task 'copy:resources', ->
  gulp.src 'app/resources/**/*'
  .pipe changed paths.dist
  .pipe gulpif !gutil.env.robots, filter (file) ->
    !/app[\\\/]resources[\\\/]robots\.txt/.test file.path
  .pipe gulp.dest paths.dist

gulp.task 'copy:scripts', ->
  gulp.src ['**/*.js'],
    base: 'app/scripts'
    cwd: 'app/scripts'
  .pipe changed paths.scripts
  .pipe gulp.dest paths.scripts

gulp.task 'copy:components', ->
  gulp.src [
      'jquery/dist/jquery.min.js'
      'svg4everybody/svg4everybody.min.js'
      'jQuery-Collapse/src/jquery.collapse.js'
      'jQuery-Collapse/src/jquery.collapse_storage.js'
      'slick/slick/slick.min.js'
      'slick/slick/slick.css'
      'slick/slick/slick-theme.css'
      'slick/slick/fonts/*'
      'fancybox/lib/jquery.mousewheel-3.0.6.pack.js'
      'fancybox/source/jquery.fancybox.js'
      'fancybox/source/helpers/*.js'
      'fancybox/**/*.{gif,png}'
      'select2/select2.min.js'
      'select2/select2.css'
      'select2/select2.png'
      'select2/select2-spinner.gif'
    ],
    base: 'components'
    cwd: 'components'
  .pipe changed paths.scripts
  .pipe gulp.dest paths.scripts + '/libs'

gulp.task 'copy', [
  'copy:components',
  'copy:images',
  'copy:resources',
  'copy:scripts'
]
