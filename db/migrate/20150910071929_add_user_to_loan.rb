class AddUserToLoan < ActiveRecord::Migration
  def change
    add_reference :loans, :user, index: true, foreign_key: true
  end
end
