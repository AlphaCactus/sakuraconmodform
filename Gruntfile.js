module.exports = function(grunt) {

	var cwd = process.cwd();

	const sass = require('sass');

	// change to parent folder to use common node modules if desired
	// but this is a non standard setup used on KH staging and dev VMs before July 2020
	//process.chdir(__dirname + '/..');

	grunt.loadNpmTasks('grunt-sass');
	grunt.loadNpmTasks('@lodder/grunt-postcss');
	grunt.loadNpmTasks('grunt-contrib-watch');
	grunt.loadNpmTasks('grunt-notify');

	process.chdir(cwd);

	grunt.initConfig({
//		pkg: {
//			name: 'rockwood' // enter the name of your project folder
//		},
		postcss: {
			options: {
				map: {
					inline: false,
					annotation: 'public/css/'
				},

				processors: [
					require('pixrem')(), // add fallbacks for rem units
					require('autoprefixer')(), // add vendor prefixes
					require('cssnano')() // minify the result
				]
			},
			dist: {
				src: 'public/css/*.css'
			}
		},

		sass: {
			options: {
				implementation: sass,
				sourceMap: true
			},
			dist: {
				files: [{
					expand: true,
					cwd: 'app/sass',
					src: ['*.scss'],
					dest: 'public/css',
					ext: '.css'
				}]
			}
		},

		watch: {
			grunt: {
				options: {
					reload: true
				},
				files: ['Gruntfile.js']
			},
			sass: {
				files: ['app/sass/*.scss'],
				tasks: ['sass','postcss','showCurrentDirectory']
			},
		},

	});
	grunt.registerTask('default', ['watch']);
	grunt.event.on('watch', function(action, filepath, target) {
		grunt.log.writeln(target + ': ' + filepath + ' has ' + action);
	});
	grunt.registerTask('showCurrentDirectory', function() { grunt.log.writeln(process.cwd());});
};
