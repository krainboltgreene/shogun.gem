{{namespace}}
========

  - [![Quality](http://img.shields.io/codeclimate/github/{{author}}/{{namespace}}.svg?style=flat-square)](https://codeclimate.com/github/{{author}}/{{namespace}})
  - [![Coverage](http://img.shields.io/codeclimate/coverage/github/{{author}}/{{namespace}}.svg?style=flat-square)](https://codeclimate.com/github/{{author}}/{{namespace}})
  - [![Build](http://img.shields.io/travis-ci/{{author}}/{{namespace}}.svg?style=flat-square)](https://travis-ci.org/{{author}}/{{namespace}})
  - [![Dependencies](http://img.shields.io/gemnasium/{{author}}/{{namespace}}.svg?style=flat-square)](https://gemnasium.com/{{author}}/{{namespace}})
  - [![Tags](http://img.shields.io/github/tag/{{author}}/{{namespace}}.svg?style=flat-square)](http://github.com/{{author}}/{{namespace}}/tags)
  - [![Releases](http://img.shields.io/github/release/{{author}}/{{namespace}}.svg?style=flat-square)](http://github.com/{{author}}/{{namespace}}/releases)
  - [![Issues](http://img.shields.io/github/issues/{{author}}/{{namespace}}.svg?style=flat-square)](http://github.com/{{author}}/{{namespace}}/issues)
  - [![License](http://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square)](http://opensource.org/licenses/MIT)
  - [![Version](http://img.shields.io/badge/version-1.0.0-blue.svg?style=flat-square)](http://github.com/{{author}}/{{namespace}})


A sample HTTP HATEOS JSON API project.


middleware
==========

All of the middleware used:

  - rack-protection, for protecting against common attack vectors
  - rack-authentication_bearer, for parsing the bearer token
  - rack-accept_setter, for storing an accept string
  - rack-content_length_setter, for determining and storing the content-length
  - rack-chuncker, for handling (automatically) body chunking
  - rack-log, for storing a global logger
  - rack-runtime, for storing the runtime
  - rack-dispatch, for handling routing
  - rack-body_serializer, for serializing the body of responses
  - rack-body_deserializer, for deserializing inputs in requests
