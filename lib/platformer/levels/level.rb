module Platformer
  module Levels
    class Level

      attr_reader :done
      alias_method :done?, :done

      def initialize(window, background_image_location)
        @window = window
        @background_image = Image.new(window, background_image_location, true)
        @done = false
      end

      def draw
        background_image.draw(0, 0, 0)
      end

      def update
        raise 'This guy. You gotta implement this in your level!'
      end

      def complete_level!
        @done = true
      end

      private

      attr_reader :window, :background_image

    end
  end
end
