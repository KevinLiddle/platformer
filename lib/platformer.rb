require 'gosu'
require 'platformer/game'

class PlatformerWindow < Gosu::Window
  HEIGHT = 768
  WIDTH  = 1024

  def initialize
    reset_buttons!
    super(WIDTH, HEIGHT, false)
    reset
  end

  def reset
    @game = Platformer::Game.new(self)
  end

  def draw
    @game.draw
  end

  def update
    @game.update
    @button_hold_callbacks.each do |button, callback|
      initiate_button_callback(callback) if button_down?(button)
    end
  end

  def button_down(button)
    callback = @button_press_callbacks[button]
    initiate_button_callback(callback) if callback
  end

  def register_button_press!(button, subject, method, *args)
    ensure_button_uniqueness(button) do
      @button_press_callbacks[button] = {subject: subject, method: method, args: args}
    end
  end

  def register_button_hold!(button, subject, method, *args)
    ensure_button_uniqueness(button) do
      @button_hold_callbacks[button] = {subject: subject, method: method, args: args}
    end
  end

  def reset_buttons!
    @button_press_callbacks = {}
    @button_hold_callbacks = {}
  end

  private

  def ensure_button_uniqueness(button, &block)
    if @button_press_callbacks.include?(button) || @button_hold_callbacks.include?(button)
      raise "The '#{button}' button is already registered!"
    else
      yield
    end
  end

  def initiate_button_callback(callback)
    if callback[:args].empty?
      callback[:subject].send(callback[:method])
    else
      callback[:subject].send(callback[:method], *callback[:args])
    end
  end

end
