module Platformer
  module Levels
    class Level

      attr_reader :done
      alias_method :done?, :done

      def initialize(window)
        setup_level(window)
      end

      def setup_level(window)
        @window = window
        @done = false
      end

      def draw
        raise_implemented_error(:draw)
      end

      def update
      end

      def complete_level!
        @done = true
      end

      private

      attr_reader :window, :wat_bro

      def raise_implemented_error(method_name)
        raise "This guy. You gotta implement #{method_name} in your level!"
      end

    end
  end
end
