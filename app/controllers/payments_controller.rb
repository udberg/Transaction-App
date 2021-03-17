class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[show update destroy edit]
  before_action :authenticate_user!

  def index
    # rubocop:disable Layout/HashAlignment
    @payments = Payment.includes(:groups).paginate(page: params[:page],
                    per_page: 2).where(user_id: current_user.id).joins(:groups)
    # rubocop:enable Layout/HashAlignment
    @payment_sum = Payment.where(user_id: current_user.id).joins(:groups).sum(:amount)
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = current_user.payments.build(payment_params)
    if @payment.save
      group_id = params[:payment][:group_id]
      PaymentsGroup.create(group_id: group_id, payment_id: @payment.id) if group_id
      flash[:success] = 'You created new payment'
      redirect_to root_path
    else
      flash.now[:alert] = 'payment was not created'
      render :new
    end
  end

  def edit
    @payment = Payment.find(params[:id])
  end

  def update
    payment = Payment.find(params[:id])
    if payment.update(payment_params)
      flash[:success] = 'You updated your payment'
      redirect_to root_path
    else
      flash[:alert] = 'payment was not updated'
      render :edit
    end
  end

  def destroy
    Payment.find(params[:id]).destroy
    flash[:success] = 'payment deleted'
    redirect_to root_path
  end

  def external_payment
    # rubocop:disable Layout/HashAlignment
    @external_payments = Payment.includes(:groups).paginate(page: params[:page],
    per_page: 2).where(user_id: current_user.id).left_outer_joins(:groups).where('groups.id IS NULL')
    # rubocop:enable Layout/HashAlignment
    @exp_sum = Payment.where(user_id: current_user.id).left_outer_joins(:groups).where('groups.id IS NULL').sum(:amount)
  end

  private

  def set_payment
    @payment = Payment.find(params[:id])
  end

  def payment_params
    params.require(:payment).permit(:name, :amount, :user_id)
  end
end
