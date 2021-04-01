class ProfilController < ApplicationController
  before_action :sign_in_check

  def index
    @user = User.find(session[:user_id]) if session[:user_id]
  end
end
