class SessionsController < ApplicationController

  def new
  end

  def create
    # raise params.inspect
    @user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect_to controller: 'welcome', action: 'home'
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end
end
