# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'openwhenready/version'

Gem::Specification.new do |spec|
  spec.name          = "openwhenready"
  spec.version       = Openwhenready::VERSION
  spec.authors       = ["Andrew Fecheyr"]
  spec.email         = ["andrew@bedesign.be"]
  spec.description   = %q{Open browser when URL is ready}
  spec.summary       = %q{Uses launchy to open a given URL whenever that URL is ready to accept incoming connections}
  spec.homepage      = "https://github.com/andruby/openwhenready"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "launchy"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
