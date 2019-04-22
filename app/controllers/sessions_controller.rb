class SessionsController < ApplicationController

  def new
  end

  def create
     @user = User.authenticate_with_credentials(params[:email], params[:password])
    # @user = User.find_by_email(params[:session][:email])
    # if @user && @user.authenticate(params[:session][:password])
    if @user
      session[:user_id] = @user.id
      redirect_to [:products]
    else
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end

end
