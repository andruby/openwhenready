# Openwhenready

Uses Launchy to open the browser to a specific URL whenever the URL is
ready to accept tcp connections. Useful when waiting for a local
webserver to finish loading.

## Installation

Add this line to your application's Gemfile:

    gem 'openwhenready'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install openwhenready

## Usage

This gem comes with a binary. Simply run it in Terminal. The command
takes one or more URL arguments `openwhenready localhost:3000`.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
