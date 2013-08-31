module Platformer
  class WatBro

    JUMP_SPEED = -75.0

    def initialize(window)
      @window = window
      @image = Image.new(window, 'media/wat-bro.png', true)
      @x = 10.0
      @y = floor_height
      @midair = false
    end

    def draw
      image.draw(@x, @y, 1)
    end

    def update
      if midair
        @t += 2.0
        @y = calculate_y
      elsif window.button_down?(Gosu::KbSpace)
        jump!
      end

      hit_ground! if @y > floor_height
    end

    private

    attr_reader :window, :image, :midair

    def jump!
      @midair = true
      @t = 0
      @y_0 = @y
    end

    def hit_ground!
      @midair = false
      @y = floor_height
    end

    def calculate_y
      @y_0 + (@t * JUMP_SPEED) + (10.0 * (@t ** 2))/2.0
    end

    def floor_height
      @floor_height ||= window.height - image.height - 50.0
    end

  end
end
