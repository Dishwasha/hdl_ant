module.exports = function(grunt) {

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    watch: {
      files: [
        'karma.conf.coffee',
        'static/**/*.coffee',
        'test/**/*.coffee'
      ]
    }
  });

  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.registerTask('default', ['watch']);

  grunt.event.on('watch', function(action, filepath) {
    grunt.util.spawn({
      cmd: 'coffee',
      args: ['-c', filepath]
    }, function() {
      console.log('Finished compiling ' + filepath);
    });
  });
};
