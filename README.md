shogun
--------

  - [![Quality](http://img.shields.io/codeclimate/github/krainboltgreene/shogun.gem.svg?style=flat-square)](https://codeclimate.com/github/krainboltgreene/shogun.gem)
  - [![Coverage](http://img.shields.io/codeclimate/coverage/github/krainboltgreene/shogun.gem.svg?style=flat-square)](https://codeclimate.com/github/krainboltgreene/shogun.gem)
  - [![Build](http://img.shields.io/travis-ci/krainboltgreene/shogun.gem.svg?style=flat-square)](https://travis-ci.org/krainboltgreene/shogun.gem)
  - [![Dependencies](http://img.shields.io/gemnasium/krainboltgreene/shogun.gem.svg?style=flat-square)](https://gemnasium.com/krainboltgreene/shogun.gem)
  - [![Downloads](http://img.shields.io/gem/dtv/shogun.svg?style=flat-square)](https://rubygems.org/gems/shogun)
  - [![Tags](http://img.shields.io/github/tag/krainboltgreene/shogun.gem.svg?style=flat-square)](http://github.com/krainboltgreene/shogun.gem/tags)
  - [![Releases](http://img.shields.io/github/release/krainboltgreene/shogun.gem.svg?style=flat-square)](http://github.com/krainboltgreene/shogun.gem/releases)
  - [![Issues](http://img.shields.io/github/issues/krainboltgreene/shogun.gem.svg?style=flat-square)](http://github.com/krainboltgreene/shogun.gem/issues)
  - [![License](http://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square)](http://opensource.org/licenses/MIT)
  - [![Version](http://img.shields.io/gem/v/shogun.svg?style=flat-square)](https://rubygems.org/gems/shogun)

![](http://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Minamoto_no_Yoritomo.jpg/471px-Minamoto_no_Yoritomo.jpg)

`shogun` is a Ruby HTTP API framework, architecture, and set of best practices  rolled into a core package. It's collection of behavior is meant to be included in a project's classes and modules.


Using
=====

To start using `shogun` you'll need to have these classes defined:

  * **Endpoint**, routes all request to the right control
  * **Control**, which contains the process the request is made
  * **Normalizer**, which cleans/sanitizes incoming data
  * **Validators**, a object that determines the validity of incoming data
  * **Model**, which persists, looks up, or changes the database
  * **Presenter**, which decorates the model
  * **Denormalizer**, manages and formats the outgoing data.

Each of these will probably be scoped to the resource, ie: You'll have a `Account::Create::Control` and `Account::Presenter`.

Each project will also need a `Server` class which mounts onto Rack. Look to each of the pieces documentation to learn more about what you can change.


Installing
==========

Add this line to your application's Gemfile:

    gem "shogun", "~> 2.1"

And then execute:

    $ bundle

Or install it yourself with:

    $ gem install shogun


Contributing
============

  1. Fork it
  2. Create your feature branch (`git checkout -b my-new-feature`)
  3. Commit your changes (`git commit -am 'Add some feature'`)
  4. Push to the branch (`git push origin my-new-feature`)
  5. Create new Pull Request


Changelog
=========

  - 2.1.0:
    * Reorganizing the rack to avoid bad requests taking up resources
    * Adding CORS support for browser clients
    * Adding explicit rack requirement, because ruby :|
  - 2.0.0:
    * Getting rid of gems we don't care about
    * Adding some tests to a few classes
    * Adding some real documentation (and logo!)
  - 1.0.0:
    * Initial release


License
=======

Copyright (c) 2014 Kurtis Rainbolt-Greene

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
