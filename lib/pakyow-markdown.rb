libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

# Gems
require 'redcarpet'
require 'rouge'
require 'rouge/plugins/redcarpet'

class Renderer < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet
end

# Config
Pakyow::Config.register(:markdown) { |config|
  # extensions to load with redcarpet
  config.opt :extensions, {
    autolink: true,
    footnotes: true,
    fenced_code_blocks: true,
  }
}

# Processor
Pakyow::App.processor(:md, :mdown, :markdown) do |content|
  markdown = Redcarpet::Markdown.new(Renderer, **Pakyow::Config.markdown.extensions)
  markdown.render(content)
end
