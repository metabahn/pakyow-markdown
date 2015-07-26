libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require 'redcarpet'

# silences the annoying redefined constant warnings
Kernel.silence_warnings do
  require 'rouge'
end

require 'rouge/plugins/redcarpet'
class Renderer < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet
end

Pakyow::Config.register(:markdown) { |config|
  # extensions to load with redcarpet
  config.opt :extensions, {
    autolink: true,
    footnotes: true,
    fenced_code_blocks: true,
  }
}

Pakyow::App.processor(:md, :mdown, :markdown) do |content|
  markdown = Redcarpet::Markdown.new(Renderer, **Pakyow::Config.markdown.extensions)
  markdown.render(content)
end
