class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    Current.user = User.find_by(id: session[:user_id])
  end

  def sign_in_check
    redirect_to root_path if Current.user.nil?
  end
end
