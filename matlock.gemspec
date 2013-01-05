# -*- encoding: utf-8 -*-
$:.unshift File.expand_path("../lib", __FILE__)

require 'matlock/version'

Gem::Specification.new do |s|
  s.name        = "matlock"
  s.version     = Matlock::VERSION
  s.authors     = ["Ben Johnson"]
  s.email       = ["benbjohnson@yahoo.com"]
  s.homepage    = "http://github.com/benbjohnson/matlock"
  s.summary     = "An intelligent web scraper"
  s.executables = ['matlock']

  s.add_dependency('mechanize', '~> 2.5.1')
  s.add_dependency('commander', '~> 4.1.3')
  s.add_dependency('active_support', '3.0.0')
  
  s.add_development_dependency('rake', '~> 10.0.3')
  s.add_development_dependency('minitest', '~> 4.3.3')
  s.add_development_dependency('mocha', '~> 0.13.1')
  s.add_development_dependency('unindentable', '~> 0.1.0')

  s.test_files   = Dir.glob("test/**/*")
  s.files        = Dir.glob("lib/**/*") + %w(README.md)
  s.require_path = 'lib'
end
