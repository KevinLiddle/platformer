Hasu.load 'lib/platformer/levels/level.rb'
Hasu.load 'media/image.rb'

module Platformer
  module Levels
    class Start < Level

      def draw
        background_image.draw(0, 0, 0)
      end

      def update
        complete_level! if window.button_down?(Gosu::KbSpace)
      end

      private

      def background_image
        @background_image ||= Image.new(window, 'media/clouds.png', true)
      end

    end
  end
end
