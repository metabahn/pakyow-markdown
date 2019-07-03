# frozen_string_literal: true

require "pakyow/framework"

require "pakyow/markdown/processor"

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

        object.state(:processor) << Pakyow::Markdown::Processer
      end
    end
  end
end
