# Scaffold project for RequireJS
## Build JS dynamic websites without running any kind of web service.
## Nodejs is only used for initial package installing, but packages can be included in distribution to get rid of this dependency.

(http://requirejs.org)
(https://github.com/jrburke/requirejs)
(https://github.com/Dishwasha/requirejs_scaffold)


How to Build
------------

First, you should install npm packages:

```
$ npm install
```

Then install javascript packages:

```
$ bower install
```

Then, build it:

```
$ make build
$ make deploy
```

Then open index.html directly from the file-system, put on web server to serve static content, or put on CDN.

Run grunt watch task to automatically compile coffee-script files instead of having to run build.

```
$ grunt watch &
```

Run tests

```
$ ./node_modules/.bin/karma start
```

Visit <http://docs.spmjs.org/> for detail information.

