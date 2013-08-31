Hasu.load 'lib/platformer/levels.rb'
Hasu.load 'lib/platformer/wat_bro.rb'

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
      end
    end

    private

    attr_reader :window, :completed_levels

    def current_level
      (levels - completed_levels).first
    end

    def levels
      @levels ||= [
        Levels::Start,
        Levels::Hell
      ].map { |level_klass| level_klass.new(window, wat_bro) }
    end

    def wat_bro
      @wat_bro ||= WatBro.new(window)
    end

  end
end
