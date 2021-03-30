class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]

  def index
    @groups = Group.includes(:user, :icon_attachment).alphabetically
  end

  def show
    @group_travels = @group.travels.includes(:user)
    @distance = @group_travels.pluck(:distance).sum
  end

  def new
    @group = Group.new
  end

  def edit; end

  def create
    @group = current_user.groups.build(group_params)

    if @group.save
      redirect_to group_path(@group), notice: 'Group was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @group.update(group_params)
      redirect_to group_path(@group), notice: 'Group was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_url, notice: 'Group was successfully destroyed.'
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :user_id, :icon)
  end
end
