class LoansController < ApplicationController

  def index
    @loans = Loan.all
  end

  def new
    @loan = Loan.new
  end

  def create
    @loans = Loan.all
    @loan = Loan.create(loan_params)
  end

  def show
    @loan = Loan.find(params[:id])
  end

  # Edit, Update, Delete NOT requirements for this app.

  private
  def loan_params
    params.require(:loan).permit(:amount, :downpayment, :interest_rate)
  end
end
