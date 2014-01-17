require 'platformer/levels'
require 'platformer/wat_bro'

module Platformer
  class Game

    def initialize(window)
      @window = window
      set_current_level!(levels.first)
    end

    def draw
      current_level.draw
    end

    def update
      current_level.update
      if current_level.done?
        set_current_level!(levels[levels.index {|level| level[:klass] == current_level.class} + 1])
      end
    end

    private

    attr_reader :window, :current_level

    def levels
      @levels ||= [
        {klass: Levels::Start, args: [window]},
        {klass: Levels::Hell, args: [window, wat_bro]}
      ]
    end

    def set_current_level!(level)
      window.reset_buttons!
      @current_level = level[:klass].new(*level[:args])
    end

    def wat_bro
      @wat_bro ||= WatBro.new(window)
    end

  end
end
