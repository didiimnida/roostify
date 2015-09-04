class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.decimal :amount, :precision => 8, :scale => 2
      t.decimal :downpayment, :precision => 8, :scale => 2
      t.decimal :interest_rate, :precision => 8, :scale => 2

      t.timestamps null: false
    end
  end
end
