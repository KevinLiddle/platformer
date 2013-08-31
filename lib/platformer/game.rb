Hasu.load 'lib/platformer/quad.rb'
Hasu.load 'lib/platformer/quad.rb'
Hasu.load 'lib/platformer/levels.rb'

module Platformer
  class Game

    def initialize(window)
      @window = window
      @completed_levels = []
    end

    def draw
      current_level.draw
    end

    def update
      current_level.update
      if current_level.done?
        completed_levels << current_level
        window.flush
      end
    end

    private

    attr_reader :window, :completed_levels

    def current_level
      (levels - completed_levels).first
    end

    def levels
      @levels ||= [
        Levels::Start.new(window),
        Levels::Hell.new(window)
      ]
    end

  end
end
