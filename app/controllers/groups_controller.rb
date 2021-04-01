class GroupsController < ApplicationController
  before_action :sign_in_check

  def new
    @groups = Group.new
  end

  def index
    @groups = Group.all
    @count = @groups.count
  end

  def show
    @groups = Group.find_by(id: params[:id])
    @group_transaction = @groups.my_transactions
    @count = @group_transaction.count
  end

  def create
    @groups = Group.new(user_attributes)
    if @groups.save
      redirect_to group_path, notice: 'Transaction Created successfully'
    else
      render :new
    end
  end

  private

  def user_attributes
    params.require(:group).permit(:name, :icon, :user_id)
  end
end
