class Loan < ActiveRecord::Base
  validates :amount, presence: true,
            numericality: true
  validates :downpayment, presence: true,
            numericality: true
  validates :interest_rate, presence: true,
            numericality: true

  has_attached_file :document

  validates_attachment :document, :content_type => { :content_type => 'application/pdf' }

end
