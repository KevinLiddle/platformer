Hasu.load 'lib/platformer/levels/level.rb'
Hasu.load 'media/image.rb'

module Platformer
  module Levels
    class Start < Level

      def initialize(window)
        super(window, "media/clouds.png")
      end

      def update
        complete_level! if window.button_down?(Gosu::KbSpace)
      end

    end
  end
end
