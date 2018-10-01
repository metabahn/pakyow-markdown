# frozen_string_literal: true

require "redcarpet"

require "rouge"
require "rouge/plugins/redcarpet"

require "pakyow/framework"

module Pakyow
  module Markdown
    class Framework < Pakyow::Framework(:markdown)
      def boot
        object.class_eval do
          configurable :markdown do
            setting :extensions, {
              autolink: true,
              footnotes: true,
              fenced_code_blocks: true,
              tables: true
            }
          end
        end

        object.processor :md, :mdown, :markdown do |content|
          Redcarpet::Markdown.new(
            Renderer, object.config.markdown.extensions
          ).render(content)
        end
      end
    end

    class Renderer < Redcarpet::Render::HTML
      include Rouge::Plugins::Redcarpet

      def block_quote(quote)
        if match = quote.match(/<p>\[(.*)\]/)
          %(<blockquote class="#{match[1]}">#{quote.gsub("[#{match[1]}]", "")}</blockquote>)
        else
          super
        end
      end
    end
  end
end
