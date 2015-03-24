class SessionController < ApplicationController

  def create
    @user = User.find_or_create(auth_hash)
    self.current_user = @user
    redirect_to '/'
  end

end
