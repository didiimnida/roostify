class LoanPdf < Prawn::Document
  def initialize(loan, view)
    super(top_margin: 50)
    @loan = loan
    @view = view
    loan_header
    loan_values
  end

  def loan_header
    font_size 16
    text "Loan Summary"
    # text #{user.name}
    font_size 10
    text "Submitted At: #{@loan.created_at}"
    text "Loan ID: #{@loan.id}"
  end

  def loan_values
    stroke_color "#000000"

    stroke do
      move_down 20
      horizontal_rule
      move_down 50
    end

    font_size 12
    text "Amount: #{price(@loan.amount)}

    Downpayment: #{price(@loan.downpayment)}

    Interest Rate: #{@loan.interest_rate}"

    stroke do
      move_down 50
      horizontal_rule
    end
  end

  def price(num)
    @view.number_to_currency(num)
  end

end