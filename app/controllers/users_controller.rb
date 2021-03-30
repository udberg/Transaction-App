class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile; end
end
