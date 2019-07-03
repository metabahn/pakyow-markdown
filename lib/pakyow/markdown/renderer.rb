# frozen_string_literal: true

require "redcarpet"

require "rouge"
require "rouge/plugins/redcarpet"

module Pakyow
  module Markdown
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
