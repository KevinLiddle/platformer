module Physics
  class FreeBody

    GRAVITY = 10.0
    COEFFICIENT_OF_FRICTION = 4.0
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

    def move_vertical!
      @y = calculate_position(y, yv, GRAVITY)
      @yv = yv + GRAVITY * TIME_DELTA
    end

    def move_horizontal!(direction, speed)
      @direction = direction
      @x += (directional_coefficient * speed * TIME_DELTA)
      @xv = speed * directional_coefficient
    end

    def slide!
      if xv.abs >= 1
        @x = calculate_position(x, xv, (-directional_coefficient * COEFFICIENT_OF_FRICTION))
        @xv = xv - (COEFFICIENT_OF_FRICTION * directional_coefficient * TIME_DELTA)
      else
        @xv = 0
      end
    end

    private

    def calculate_position(initial_position, velocity, acceleration)
      initial_position + (velocity * TIME_DELTA) + ((acceleration / 2) * (TIME_DELTA ** 2))
    end

    def directional_coefficient
      direction == RIGHT ? 1 : -1
    end

  end
end
