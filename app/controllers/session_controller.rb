class SessionController < ApplicationController

  def create
    @user = User.find_or_create(auth_hash)
    session['user_id'] = @user.id
    self.current_user = @user
    redirect_to '/'
  end

  def destroy
    session['user_id'] = nil
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end
