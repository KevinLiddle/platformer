Hasu.load 'lib/platformer/levels/level.rb'
Hasu.load 'lib/platformer/quad.rb'
Hasu.load 'media/colors.rb'
Hasu.load 'media/image.rb'

module Platformer
  module Levels
    class Hell < Level

      def draw
        draw_background
        draw_floor
        draw_platform_1
        wat_bro.draw
      end

      def update
        wat_bro.update
      end

      private

      def draw_background
        Image.new(window, 'media/hieronymous_bosch.jpg', true).draw(0, 0, 0)
      end

      def draw_floor
        Quad.new(
          window,
          0,
          window.width,
          window.height - 50,
          window.height,
          platform_color
        ).draw
      end

      def draw_platform_1
        Quad.new(
          window,
          500,
          800,
          window.height - 330,
          window.height - 300,
          platform_color
        ).draw
      end

      def platform_color
        @platform_color ||= Colors.rgba(0x554d30ff)
      end

    end
  end
end
