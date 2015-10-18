require 'redcarpet'

require 'rouge'
require 'rouge/plugins/redcarpet'

require 'version'

module Pakyow
  module Markdown
    class Renderer < Redcarpet::Render::HTML
      include Rouge::Plugins::Redcarpet
    end
  end
end

Pakyow::Config.register :markdown do |config|
  # Extensions to load with Redcarpet
  config.opt :extensions, {
    autolink: true,
    footnotes: true,
    fenced_code_blocks: true
  }
end

Pakyow::App.processor :md, :mdown, :markdown do |content|
  Redcarpet::Markdown.new(
    Pakyow::Markdown::Renderer, **Pakyow::Config.markdown.extensions
  ).render(content)
end
