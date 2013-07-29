libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

# Gems 
require 'rdiscount'

# Processor
Pakyow::App.processor(:md, :mdown, :markdown) { |content|
  RDiscount.new(content).to_html
}
