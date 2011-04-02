# encoding: utf-8
#
# Demonstrate use of stamps
#
require File.expand_path(File.join(File.dirname(__FILE__),
                                   %w[.. example_helper]))

Prawn::Document.generate("text_box_with_leading.pdf") do
  w = 100
  h = 50
  spacing = 50
  message = "1234567890"
  size = 20

  y = bounds.top
  
  [:top, :center, :bottom].each do |valign|
    x = bounds.left
    
    [0, 15, -4].each do |leading|
      transparent 0.5 do
        stroke_rectangle [x, y], w, h
      fill_color 100, 0, 0, 0
      text_box message, :at => [x, y], :width => w, :height => h, :valign => valign, :size => size, :leading => leading
      fill_color 0, 0, 0, 100
      text_box({:valign => valign, :leading => leading}.inspect, :at => [x, y - h - 3], :width => w, :height => spacing)
      end

      x += w + spacing
    end
    
    y -= h + spacing
  end
end
