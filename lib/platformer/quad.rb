module Platformer
  class Quad

    def initialize(window, x1, x2, y1, y2, color)
      @window = window
      @x1 = x1
      @x2 = x2
      @y1 = y1
      @y2 = y2
      @color = color
    end

    def draw
      window.draw_quad(
        x1, y1, color,
        x1, y2, color,
        x2, y2, color,
        x2, y1, color
      )
    end

    private

    attr_reader :window, :x1, :x2, :y1, :y2, :color

  end
end
