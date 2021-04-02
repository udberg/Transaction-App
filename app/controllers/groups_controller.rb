class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @groups = Group.includes(:user).paginate(page: params[:page], per_page: 2).order(:name)
  end

  def show
    @group = Group.find(params[:id])
    @group_payments = @group.payments.paginate(page: params[:page], per_page: 2).order('created_at DESC')
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)

    if @group.save
      flash[:success] = 'Group created'
      redirect_to @group
    else
      flash.now[:alert] = 'Group was not created'
      render :new
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end
end
