libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

# Gems 
require 'rdiscount'

# Processor
Pakyow::App.processor(:md, :mdown, :markdown) do |content|
  RDiscount.new(content).to_html
end
