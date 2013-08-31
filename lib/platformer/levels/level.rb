module Platformer
  module Levels
    class Level

      attr_reader :done
      alias_method :done?, :done

      def initialize(window)
        @window = window
        @done = false
      end

      def update
        raise 'Wat bro? You gots ta be able to update!'
      end

      def complete_level!
        @done = true
      end

      private

      attr_reader :window

    end
  end
end
