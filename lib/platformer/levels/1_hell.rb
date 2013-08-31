Hasu.load 'lib/platformer/levels/level.rb'
Hasu.load 'media/colors.rb'
Hasu.load 'media/image.rb'

module Platformer
  module Levels
    class Hell < Level

      def update
        Image.new(window, "media/hieronymous_bosch.jpg", true).draw(0, 0, 0)
        Quad.new(
          window,
          0,
          window.width,
          window.height - 50,
          window.height,
          Colors::GREEN
        ).draw
      end

    end
  end
end
