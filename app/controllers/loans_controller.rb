class LoansController < ApplicationController

  def index
    @loans = current_user.loans
  end

  def new
    @loan = Loan.new
  end

  def create
    @loans = current_user.loans
    @loan = Loan.create(loan_params)
    pdf = LoanPdf.new(@loan, view_context)
    pdf.render_file("/tmp/loan.pdf")
    pdf_file = File.open('/tmp/loan.pdf')
    @loan.user_id = current_user.id
    @loan.document = pdf_file
    @loan.save
    UserMailer.welcome_email(current_user).deliver_now
  end

  def show
    @loan = current_user.loans.find(params[:id])

    #Generate new PDF (send format through as pdf from view):
    # respond_to do |format|
    #   format.html
    #   format.pdf do
    #     pdf = LoanPdf.new(@loan, view_context)
    #     send_data pdf.render, filename: "loan_#{@loan.id}.pdf",
    #                           type: "application/pdf",
    #                           disposition: "inline"
    #   end
    # end
  end

  # Edit, Update, Delete NOT requirements for this app.

  private
  def loan_params
    params.require(:loan).permit(:amount, :downpayment, :interest_rate)
  end
end
