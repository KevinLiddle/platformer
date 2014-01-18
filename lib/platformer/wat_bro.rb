require 'physics/free_body'
require 'utils/buttons'
require 'utils/image'

module Platformer
  class WatBro

    JUMP_SPEED = -75
    RUN_SPEED = 20
    AIR_SWIM_SPEED = 2
    STOPPING_DISTANCE = 50

    def initialize(window)
      @window = window
      @midair = false
      @body_coords = ::Physics::FreeBody.new(12, floor_height)
    end

    def draw
      case body_coords.direction
      when Physics::FreeBody::RIGHT
        image.draw(body_coords.x, body_coords.y, 1)
      when Physics::FreeBody::LEFT
        image.draw_rot(body_coords.x, body_coords.y, 1, 180, 1, 0, 1, -1)
      end
    end

    def update
      set_vertial_motion!
      set_horizontal_motion!
      hit_ground! if body_coords.y > floor_height
    end

    def register_buttons!
      window.register_button_press!(Utils::Buttons::SPACE, self, :jump!)
      window.register_button_hold!(Utils::Buttons::RIGHT, self, :run!, Physics::FreeBody::RIGHT)
      window.register_button_hold!(Utils::Buttons::LEFT, self, :run!, Physics::FreeBody::LEFT)
    end

    def run!(direction)
      body_coords.move_horizontal!(direction, RUN_SPEED) unless midair
    end

    private

    attr_reader :window, :midair, :body_coords

    def set_horizontal_motion!
      if midair
        body_coords.move_horizontal!(body_coords.direction, body_coords.xv.abs)
      else
        body_coords.slide! if (!running? && body_coords.xv != 0)
      end
    end

    def set_vertial_motion!
      if midair
        body_coords.set_vertical_position!
        body_coords.set_vertical_velocity!
      end
    end

    def running?
      window.button_down?(Utils::Buttons::LEFT) || window.button_down?(Utils::Buttons::RIGHT)
    end

    def jump!
      unless midair
        @midair = true
        body_coords.yv = JUMP_SPEED
      end
    end

    def hit_ground!
      @midair = false
      body_coords.y = floor_height
      body_coords.yv = 0
    end

    def floor_height
      @floor_height ||= window.height - image.height - 50
    end

    def image
      @image ||= Utils::Image.new(window, 'media/wat-bro.png', true)
    end

  end
end
