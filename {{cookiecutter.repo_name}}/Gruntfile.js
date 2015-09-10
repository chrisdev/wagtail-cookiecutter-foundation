module.exports = function(grunt) {

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    imagemin: {
      media: {
        files: [{
          expand: true,
          cwd: 'media/images/',
          src: '{,*/}*.{png,jpg,jpeg,gif}',
          dest: 'media/images'
        }]
      }
    },
  });

  grunt.loadNpmTasks('grunt-contrib-imagemin');
  grunt.registerTask('default', ['imagemin']);
};