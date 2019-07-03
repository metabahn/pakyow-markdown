# frozen_string_literal: true

require "redcarpet"

require "pakyow/presenter/processor"

require "pakyow/markdown/renderer"

module Pakyow
  module Markdown
    class Processer < Pakyow::Presenter::Processor
      extensions :md, :mdown, :markdown

      def initialize(*)
        super

        @markdown = Redcarpet::Markdown.new(
          Renderer, @app.config.markdown.extensions
        )
      end

      def call(content)
        @markdown.render(content)
      end
    end
  end
end
