Hasu.load 'lib/platformer/levels/level.rb'
Hasu.load 'media/image.rb'

module Platformer
  module Levels
    class Start < Level

      def update
        Image.new(window, "media/clouds.png", true).draw(0, 0, 0)
        complete_level! if window.button_down?(Gosu::KbSpace)
      end

    end
  end
end
