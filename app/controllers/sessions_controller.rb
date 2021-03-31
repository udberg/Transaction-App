class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:name])
    if user.present?
      session[:user_id] = user.id
      redirect_to main_path, notice: 'Log in successfully'
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Log out successfully!'
  end
end
