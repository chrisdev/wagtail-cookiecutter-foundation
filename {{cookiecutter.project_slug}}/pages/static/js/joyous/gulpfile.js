(function() {
  var coffee, gulp, notify, plumber, sourcemaps, util;

  process.env.NODE_DISABLE_COLORS = 1;

  gulp = require("gulp");

  util = require("gulp-util");

  plumber = require("gulp-plumber");

  notify = require("gulp-notify");

  coffee = require("gulp-coffee");

  sourcemaps = require("gulp-sourcemaps");

  gulp.task("src.coffee", function() {
    return gulp.src("*.coffee").pipe(plumber(notify.onError(function(err) {
      util.log(err);
      return {
        title: "Burnt the coffee",
        message: "" + err
      };
    }))).pipe(coffee()).pipe(gulp.dest("."));
  });

  gulp.task("src.coffee.with.maps", function() {
    return gulp.src("*.coffee").pipe(plumber(notify.onError(function(err) {
      util.log(err);
      return {
        title: "Burnt the coffee",
        message: "" + err
      };
    }))).pipe(sourcemaps.init()).pipe(sourcemaps.write("maps/")).pipe(coffee()).pipe(gulp.dest("."));
  });

  gulp.task('build', ['src.coffee.with.maps']);

  gulp.task('watch', function() {
    return gulp.watch("*.coffee", ['src.coffee.with.maps']);
  });

  gulp.task('default', ['watch', 'build']);

}).call(this);
