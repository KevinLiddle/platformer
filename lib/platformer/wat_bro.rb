Hasu.load 'lib/utils/buttons.rb'
Hasu.load 'lib/utils/image.rb'

module Platformer
  class WatBro

    JUMP_SPEED = -75
    RUN_SPEED = 10
    RIGHT = :right
    LEFT = :left

    def initialize(window)
      @window = window
      @image = Utils::Image.new(window, 'media/wat-bro.png', true)
      @x = 10
      @y = floor_height
      @midair = false
      @direction = RIGHT
    end

    def draw
      case direction
      when RIGHT
        image.draw(@x, @y, 1)
      when LEFT
        image.draw_rot(@x, @y, 1, 180, 1, 0, 1, -1)
      end
    end

    def update
      set_vertial_motion
      set_horizontal_motion
      hit_ground! if @y > floor_height
    end

    private

    attr_reader :window, :image, :midair, :direction

    def set_horizontal_motion
      if window.button_down?(Utils::Buttons::RIGHT)
        @x += RUN_SPEED
        @direction = RIGHT
      elsif window.button_down?(Utils::Buttons::LEFT)
        @x -= RUN_SPEED
        @direction = LEFT
      end
    end

    def set_vertial_motion
      if midair
        @t += 0.5
        @y = calculate_y
      elsif window.button_down?(Utils::Buttons::SPACE)
        jump!
      end
    end

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
      @floor_height ||= window.height - image.height - 50
    end

  end
end
