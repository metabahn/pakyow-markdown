# frozen_string_literal: true

require "redcarpet"

require "rouge"
require "rouge/plugins/redcarpet"

require "pakyow/core/framework"

module Pakyow
  module Markdown
    class Framework < Pakyow::Framework(:markdown)
      def boot
        app.class_eval do
          settings_for :markdown do
            setting :extensions, {
              autolink: true,
              footnotes: true,
              fenced_code_blocks: true
            }
          end
        end

        app.processor :md, :mdown, :markdown do |content|
          Redcarpet::Markdown.new(
            Renderer, app.config.markdown.extensions
          ).render(content)
        end
      end
    end

    class Renderer < Redcarpet::Render::HTML
      include Rouge::Plugins::Redcarpet
    end
  end
end
