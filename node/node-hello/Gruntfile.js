'use strict';

module.exports = function(grunt) {
    grunt.initConfig({
        exec: {
            eslint: 'node node_modules/eslint/bin/eslint .',
            jsdoc: 'jsdoc -d html -r lib',
            jshint: 'node node_modules/jshint/bin/jshint .',
            tidy: 'find . -type d -name node_modules -prune -o -type f -name "*.html" \\( -exec tidy -qe {} \\; -o -print \\) 2>&1 | grep -v "canvas>" | grep -v "proprietary attribute"; true'
        }
    });

    grunt.loadNpmTasks('grunt-exec');
    grunt.registerTask('default', ['exec:jshint', 'exec:tidy']);

    grunt.registerTask('doc', ['exec:jsdoc']);
    grunt.registerTask('lint', [
        'exec:jshint',
        'exec:tidy'
    ]);

    grunt.registerTask('eslint', ['exec:eslint']);
    grunt.registerTask('jsdoc', ['exec:jsdoc']);
    grunt.registerTask('jshint', ['exec:jshint']);
    grunt.registerTask('tidy', ['exec:tidy']);
};
