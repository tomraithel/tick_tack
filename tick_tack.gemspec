# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tick_tack/version'

Gem::Specification.new do |spec|
  spec.name          = "tick_tack"
  spec.version       = TickTack::VERSION
  spec.authors       = ["Tom Raithel"]
  spec.email         = ["t.raithel@googlemail.com"]

  spec.summary       = %q{A simple calendar gem.}
  spec.description   = %q{Helps you writing calendar functionality by providing an abstraction for years, months, and days.}
  spec.homepage      = "https://github.com/tomraithel/tick_tack"
  spec.license       = "MIT"

  spec.required_ruby_version     = '>= 2.2.2'
  spec.required_rubygems_version = '>= 2.0.0'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
