GEM_NAME = 'pakyow-markdown'

version = File.read(File.join(File.expand_path("../VERSION", __FILE__))).strip
presenter_path = File.exists?(GEM_NAME) ? GEM_NAME : '.'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = GEM_NAME
  s.version     = version
  s.summary     = 'Pakyow view processor for markdown.'
  s.description = 'A view processor for Pakyow that automatically converts Markdown views with .md or .markdown extensions to HTML.'
  s.required_ruby_version = '>= 2.0.0'

  s.authors           = ['Bryan Powell']
  s.email             = 'bryan@metabahn.com'
  s.homepage          = 'http://pakyow.com'

  s.files        = Dir[
                        File.join(presenter_path, 'CHANGES'),
                        File.join(presenter_path, 'README'),
                        File.join(presenter_path, 'MIT-LICENSE'),
                        File.join(presenter_path, 'lib','**','*')
                      ]

  s.require_path = File.join(presenter_path, 'lib')

  s.add_dependency('pakyow-support', '~> 0.9')
  s.add_dependency('pakyow-core', '~> 0.9')
  s.add_dependency('pakyow-presenter', '~> 0.9')
  s.add_dependency('redcarpet', '~> 3.3')
  s.add_dependency('rouge', '~> 1.9')

  s.add_development_dependency('rake', '~> 10.4')
  s.add_development_dependency('minitest', '~> 5.8')
  s.add_development_dependency('minitest-focus', '~> 1.1')
end
