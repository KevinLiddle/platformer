Hasu.load 'lib/platformer/quad.rb'
Hasu.load 'lib/platformer/quad.rb'
Hasu.load 'lib/platformer/levels.rb'

module Platformer
  class Game

    def initialize(window)
      @window = window
      @completed_levels = []
    end

    def start
      levels.first.update
    end

    def update
      current_level = (levels - completed_levels).first
      current_level.update
      if current_level.done?
        completed_levels << current_level
        window.flush
      end
    end

    private

    attr_reader :window, :completed_levels

    def levels
      @levels ||= [
        Levels::Start.new(window),
        Levels::Hell.new(window)
      ]
    end

    def center_x(object_width)
      window.width/2.0 - object_width/2.0
    end

    def center_y(object_height)
      window.height/2.0 - object_height/2.0
    end

  end
end
