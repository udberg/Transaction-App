class TransactionsController < ApplicationController
  before_action :sign_in_check

  def new
    @transactions = Transaction.new
  end

  def index
    @transactions = Transaction.user_transac(Current.user.id)
    @sum = Transaction.sum_amount(Current.user.id)
  end

  def external
    @transactions = Transaction.ext_transaction
    @sum = @transactions.sum_amount(Current.user.id)

    render :index
  end

  def update
    @groups = Group.where('id > 0')
    @transaction = Transaction.find_by(id: params[:id])
  end

  def group
    @group = Group.find_by(name: params[:group])
    Transaction.find(params[:transaction_id]).groups << Group.find(@group.id)
    @trans_update = Transaction.find_by(id: params[:transaction_id])
    @trans_update.update_columns(author_id: 1)
    redirect_to group_path
  end

  def create
    @transactions = Transaction.new(user_attributes)
    if @transactions.save
      redirect_to transaction_path, notice: 'Transaction Created successfully'
    else
      render :new
    end
  end

  private

  def user_attributes
    params.require(:transaction).permit(:name, :amount, :user_id)
  end
end
