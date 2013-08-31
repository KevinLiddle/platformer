Hasu.load 'lib/platformer/levels/level.rb'
Hasu.load 'media/colors.rb'
Hasu.load 'media/image.rb'

module Platformer
  module Levels
    class Hell < Level

      def initialize(window)
        super(window, "media/hieronymous_bosch.jpg")
      end

      def draw
        super
        Quad.new(
          window,
          0,
          window.width,
          window.height - 50,
          window.height,
          Colors::GREEN
        ).draw
      end

      def update
      end

    end
  end
end
