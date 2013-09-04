Hasu.load 'lib/utils/buttons.rb'
Hasu.load 'lib/utils/image.rb'

module Platformer
  class WatBro

    JUMP_SPEED = -75
    RUN_SPEED = 10
    RIGHT = :right
    LEFT = :left
    STOPPING_DISTANCE = 50

    def initialize(window)
      @window = window
      @image = Utils::Image.new(window, 'media/wat-bro.png', true)
      @x = 12
      @y = floor_height
      @midair = false
      @sliding = false
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

    attr_reader :window, :image, :midair, :sliding, :direction

    def set_horizontal_motion
      if window.button_down?(Utils::Buttons::RIGHT) || (midair && direction == RIGHT)
        @x += RUN_SPEED
        @direction = RIGHT
        start_slide
      elsif window.button_down?(Utils::Buttons::LEFT) || (midair && direction == LEFT)
        @x -= RUN_SPEED
        @direction = LEFT
        start_slide
      elsif sliding
        @x_t += 0.5
        @x = calculate_x_sliding
      end
    end

    def set_vertial_motion
      if midair
        @y_t += 0.5
        @y = calculate_y
      elsif window.button_down?(Utils::Buttons::SPACE)
        jump!
      end
    end

    def start_slide
      @sliding = true
      @x_t = 0
      @x_0 = @x
    end

    def jump!
      @midair = true
      @y_t = 0
      @y_0 = @y
    end

    def hit_ground!
      @midair = false
      @y = floor_height
    end

    def calculate_x_sliding
      if (@x - @x_0).abs >= STOPPING_DISTANCE
        @sliding = false
        return @x
      else
        if direction == RIGHT
          @x_0 + (@x_t * RUN_SPEED) - (0.5 * (@x_t ** 2))
        else
          @x_0 - (@x_t * RUN_SPEED) + (0.5 * (@x_t ** 2))
        end
      end
    end

    def calculate_y
      @y_0 + (@y_t * JUMP_SPEED) + (5.0 * (@y_t ** 2))
    end

    def floor_height
      @floor_height ||= window.height - image.height - 50
    end

  end
end
