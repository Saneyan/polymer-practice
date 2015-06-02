gulp = require 'gulp'
sass = require 'gulp-sass'
watch = require 'gulp-watch'
concat = require 'gulp-concat'
jade = require 'gulp-jade'
coffee = require 'gulp-coffee'

gulp.task 'default', ['sass', 'vendor', 'jade', 'coffee']

gulp.task 'sass', ->
	gulp.src "./app/src/sass/style.sass"
		.pipe sass
			indentedSyntax: true
			errLogToConsole: true
		.pipe gulp.dest "./app/public/css/"

gulp.task 'jade:components', ->
	gulp.src "./app/src/jade/components/**/*.jade"
		.pipe jade
			pretty: true
		.pipe gulp.dest "./app/public/html/components"

gulp.task 'jade:view', ->
	gulp.src "./app/src/jade/view/**/*.jade
		.pipe jade
			pretty: true
		.pipe gulp.dest "./app/public/html/view"

gulp.task 'coffee', ->
	gulp.src "./app/src/coffee/**/*.coffee"
		.pipe coffee
			bare: true
		.pipe gulp.dest "./app/public/js/"

gulp.task 'vendor', ['vendor:js', 'vendor:components']

gulp.task 'vendor:js', ->
	gulp.src [
		"./bower_components/webcomponents/webcomponents.min.js"
	]
		.pipe concat "vendor.js"
		.pipe gulp.dest "./app/public/js/"

gulp.task 'vendor:components', ->
