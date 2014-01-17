require 'platformer/levels/level'
require 'utils/buttons'
require 'utils/image'

module Platformer
  module Levels
    class Start < Level

      def initialize(window)
        setup_level(window)
        @window.register_button_press!(Utils::Buttons::SPACE, self, :complete_level!)
      end

      def draw
        background_image.draw(0, 0, 0)
      end

      private

      attr_reader :window

      def background_image
        @background_image ||= Utils::Image.new(window, 'media/clouds.png', true)
      end

    end
  end
end
