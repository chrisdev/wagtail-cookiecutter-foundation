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

    bgShell: {
      _defaults: {
        bg: true,
        stdout: false,
        stderr: false,
      },
      runDjango: {
        cmd: 'python manage.py runserver'
      },
    },

    browserSync: {
      dev: {
        bsFiles: {
          src : 'pages/static/css/app.scss'
        },
        options: {
          proxy:  "localhost:8000"
        }
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-imagemin');
  grunt.loadNpmTasks('grunt-bg-shell');
  grunt.loadNpmTasks('grunt-browser-sync');
  grunt.registerTask('default', ['imagemin']);
  grunt.registerTask('browser-sync', [
    'bgShell',
    'browserSync'
  ]);
};