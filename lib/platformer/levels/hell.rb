require 'platformer/levels/level'
require 'platformer/quad'
require 'utils/colors'
require 'utils/image'

module Platformer
  module Levels
    class Hell < Level

      def initialize(window, wat_bro)
        setup_level(window)
        @wat_bro = wat_bro
        @wat_bro.register_buttons!
      end

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

      attr_reader :window, :wat_bro

      def draw_background
        background_image.draw(0, 0, 0)
      end

      def draw_floor
        @floor ||= Quad.new(
          window,
          0,
          window.width,
          window.height - 50,
          window.height,
          platform_color
        )
        @floor.draw
      end

      def draw_platform_1
        @platform_1 ||= Quad.new(
          window,
          500,
          800,
          window.height - 330,
          window.height - 300,
          platform_color
        )
        @platform_1.draw
      end

      def platform_color
        @platform_color ||= Utils::Colors.rgba(0x554d30ff)
      end

      def background_image
        @background_image ||= Utils::Image.new(window, 'media/hieronymous_bosch.jpg', true)
      end

    end
  end
end
