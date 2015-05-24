# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'estreet/version'

Gem::Specification.new do |spec|
  spec.name          = "estreet"
  spec.version       = Estreet::VERSION
  spec.authors       = ["Alex Michaud"]
  spec.email         = ["alex@bucketosoftware.com"]
  spec.summary       = %q{Create simple estree-type ASTs from Ruby}
  spec.description   = <<-DESC
Create simple estree-type abstract syntax trees (ASTs) from Ruby.
You could use it in the code generation part of a Ruby-based
transpiler, if you're so inclined.
  DESC
  spec.homepage      = "https://github.com/BucketOSoftware/estreet"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "pry-byebug", "~> 3.1"
end
