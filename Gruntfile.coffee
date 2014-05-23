###*
 * grunt-akamai-rest-purge
 *
 * Copyright (c) 2014 Bastian Behrens
 * Licensed under the MIT license.
 *
###
module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig

    jshint:
      options:
        jshintrc: ".jshintrc"
      all: ["tasks/*.js"]

    akamai_rest_purge:
      options:
        auth:
          user: 'username'
          pass: 'password'
      all:
        objects: ['http://www.your-domain.com/*']
      download:
        options:
          action: 'invalidate'
          proxy: 'http://some-proxy.com'
        objects: ['http://www.your-domain.com/downloads/*']


  # Actually load this plugin's task(s).
  grunt.loadTasks "tasks"

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks "grunt-contrib-jshint"

  grunt.registerTask "default", ["jshint"]
