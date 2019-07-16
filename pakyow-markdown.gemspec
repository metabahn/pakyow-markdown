# frozen_string_literal: true

require File.expand_path("../lib/pakyow/markdown/version", __FILE__)

Gem::Specification.new do |spec|
  spec.name        = "pakyow-markdown"
  spec.version     = Pakyow::Markdown::VERSION
  spec.summary     = "Pakyow Markdown"
  spec.description = "Markdown support for Pakyow Presenter"

  spec.author   = "Bryan Powell"
  spec.email    = "bryan@bryanp.org"
  spec.homepage = "https://pakyow.com"

  spec.required_ruby_version = ">= 2.5.0"

  spec.license = "LGPL-3.0"

  spec.files        = Dir["CHANGELOG.md", "README.md", "LICENSE", "lib/**/*"]
  spec.require_path = "lib"

  spec.add_dependency "pakyow-presenter", "~> 1.0.0"

  spec.add_dependency "redcarpet", "~> 3.4"
  spec.add_dependency "rouge", "~> 3.5"
end
