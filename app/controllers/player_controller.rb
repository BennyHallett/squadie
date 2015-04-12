class PlayerController < ApplicationController

  before_filter :logged_in

  def index
    @players = current_user.players
  end

end
