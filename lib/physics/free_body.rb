module Physics
  class FreeBody

    GRAVITY = 10.0
    TIME_DELTA = 0.5
    RIGHT = :right
    LEFT = :left

    attr_accessor :x, :y, :xv, :yv,
      :direction

    def initialize(x, y, xv=0, yv=0)
      @x = x
      @y = y
      @xv = xv
      @yv = yv
      @direction = RIGHT
    end

    # d = position
    # v = velocity
    # a = acceleration
    # ----------------
    # v^2 = v0^2 + 2ad
    # d = v0t + 1/2*at^2
    # v = v0 + at

    def set_vertical_velocity!
      @yv = yv + GRAVITY * TIME_DELTA
    end

    def set_vertical_position!
      @y = y + (TIME_DELTA * yv) + ((GRAVITY / 2) * (TIME_DELTA ** 2))
    end

    def move_horizontal!(direction, speed)
      @direction = direction
      @x += (directional_coefficient * speed)
      @xv = speed * directional_coefficient
    end

    def slide!
      if xv.abs >= 1
        @x = x + (xv * TIME_DELTA) - (0.5 * directional_coefficient * (TIME_DELTA ** 2))
        @xv = xv - (TIME_DELTA * directional_coefficient)
      else
        @xv = 0
      end
    end

    private

    def directional_coefficient
      direction == RIGHT ? 1 : -1
    end

  end
end
