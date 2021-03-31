class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_attributes)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Your account have been set up successfully'
    else
      render :new
    end
  end

  private

  def user_attributes
    params.require(:user).permit(:name)
  end
end
