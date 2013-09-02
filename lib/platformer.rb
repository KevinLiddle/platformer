require 'hasu'
Hasu.load 'lib/platformer/game.rb'

class Window < Hasu::Window
  HEIGHT = 768
  WIDTH  = 1024

  def initialize
    super(WIDTH, HEIGHT, false)
  end

  def reset
    @game = Platformer::Game.new(self)
  end

  def draw
    @game.draw
  end

  def update
    @game.update
  end

end

Window.run
