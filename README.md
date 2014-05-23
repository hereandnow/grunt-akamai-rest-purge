# grunt-akamai-rest-purge

> Purging Akamai via their Rest Interface

## Getting Started
This plugin requires Grunt `~0.4.0`

If you haven't used [Grunt](http://gruntjs.com/) before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started) guide, as it explains how to create a [Gruntfile](http://gruntjs.com/sample-gruntfile) as well as install and use Grunt plugins. Once you're familiar with that process, you may install this plugin with this command:

```shell
npm install grunt-akamai-rest-purge --save-dev
```

Once the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript:

```js
grunt.loadNpmTasks('grunt-akamai-rest-purge');
```

## The "akamai_rest_purge" task

### Overview
In your project's Gruntfile, add a section named `akamai_rest_purge` to the data object passed into `grunt.initConfig()`.

```js
grunt.initConfig({
  akamai_rest_purge: {
    options: {
      // Task-specific options go here.
    },
    your_target: {
      // Target-specific file lists and/or options go here.
    },
  },
});
```

### Akamai-Options

Read more about Akamai-Purge-Request-Body [here](https://api.ccu.akamai.com/ccu/v2/docs/index.html#section_PurgeRequest)

#### options.auth (Mandatory)
Type: `Object`
Default value: `none`
Possible values: `{user: '', pass: ''}` or `{username: '', password: ''}` or `{'bearer': 'bearerToken'}`

Mandatory and used for Basic Authentication.

#### options.type
Type: `String`
Default value: `'arl'`
Possible values: `'arl'` or `'cpcode'`

arl or cpcode. Requests of type arl can include ARLs, URLs, or both.

#### options.domain
Type: `String`
Default value: `'production'`
Possible values: `'production'` or `'staging'`

#### options.action
Type: `String`
Default value: `'remove'`
Possible values: `'remove'` or `'invalidate'`

__remove__ deletes the content from Edge server caches. The next time an Edge server receives a request for the content, it will retrieve the current version from the origin server. If it cannot retrieve a current version, it will follow instructions in your server configuration. __invalidate__ marks the cached content as invalid. The next time a server receives a request for the content, it sends an HTTP conditional GET (If-Modified-Since) request to the origin. If the content has changed, the origin server returns a full fresh copy. Otherwise, the origin normally responds that the content has not changed, and the Edge server can serve the already-cached content.

### Request-Options

This Plugin uses internally the famous [request-module](https://npmjs.org/package/request). You can use __all__ Options from Request (e.g. proxy)

### Usage Examples

#### Basic Example

In this example 1 Task is registered.

The Task uses the default options (only Auth Options set).

```js
grunt.initConfig({
  akamai_rest_purge: {
    options: {
      auth: {
        user: 'username',
        pass: 'password'
      }
    },
    all: {
      objects: ['http://www.your-domain.com/*']
    }
  },
});
```

#### Complex Example

In this example 2 Tasks are registered.

The Task `all` uses the default options.

The Task `downloads` uses the default options, overwrites the action attribute and sets a proxy.

```js
grunt.initConfig({
  akamai_rest_purge: {
    options: {
      auth: {
        user: 'username',
        pass: 'password'
      }
    },
    all: {
      objects: ['http://www.your-domain.com/*']
    },
    downloads: {
      options: {
        action: 'invalidate',
        proxy: 'http://some-proxy.com'
      },
      objects: ['http://www.your-domain.com/downloads/*']
    }
  },
});
```

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality. Lint and test your code using [Grunt](http://gruntjs.com/).

## Release History

### 0.1.0 - Initial Version
