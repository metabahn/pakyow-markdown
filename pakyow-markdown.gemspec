require File.expand_path('../lib/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = 'pakyow-markdown'
  spec.summary       = 'Pakyow Markdown'
  spec.description   = 'Markdown support for Pakyow views'
  spec.author        = 'Bryan Powell'
  spec.email         = 'bryan@metabahn.com'
  spec.homepage      = 'http://pakyow.org'
  spec.version       = Pakyow::Markdown::VERSION
  spec.require_path  = 'lib'
  spec.files         = `git ls-files`.split("\n")
  spec.license       = 'MIT'

  spec.add_dependency('pakyow-support', '~> 0')
  spec.add_dependency('pakyow-core', '~> 0')
  spec.add_dependency('pakyow-presenter', '~> 0')

  spec.add_dependency('redcarpet', '~> 3.3')
  spec.add_dependency('rouge', '~> 1.11')

  spec.add_development_dependency('rake', '~> 11.2')
  spec.add_development_dependency('minitest', '~> 5.8')
  spec.add_development_dependency('minitest-focus', '~> 1.1')
end
