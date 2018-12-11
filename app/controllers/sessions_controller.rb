class SessionsController < ApplicationController

  def new
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      user_session = User.find_by_email(params[:email])
      session[:user_id] = user_session.id
      redirect_to '/', notice: 'Logged in!'
    else

      redirect_to '/login'
  end
end

  def destroy
    session[:user_id] = nil
    redirect_to '/login', notice: 'Logged Out!'
  end

end
