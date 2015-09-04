task :make_pdf => :environment do

  loan = Loan.last
  Prawn::Document.generate("test_prawn.pdf") do

    font_size 16
    text "Loan Summary"
    # text #{user.name}
    font_size 10
    text "Submitted At: #{loan.created_at}"
    text "Loan ID: #{loan.id}"

    stroke_color "#000000"

    stroke do
      move_down 20
      horizontal_rule
      move_down 50
    end

    font_size 12
    text "Amount: $#{loan.amount}

    Downpayment: $#{loan.downpayment}

    Interest Rate: #{loan.interest_rate}"

    stroke do
      move_down 50
      horizontal_rule
    end

  end
end
