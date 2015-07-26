gulp = require 'gulp'
ghpages = require 'gulp-gh-pages'

gulp.task 'ghpages', ->
  gulp.src [
    'dist/**/*'
    '.nojekyll'
  ]
  .pipe ghpages branch: 'gh-pages'
