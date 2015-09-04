class Loan < ActiveRecord::Base
  validates :amount, presence: true,
            numericality: true
  validates :downpayment, presence: true,
            numericality: true
  validates :interest_rate, presence: true,
            numericality: true
end
