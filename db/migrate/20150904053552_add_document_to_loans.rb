class AddDocumentToLoans < ActiveRecord::Migration
  def self.up
    add_attachment :loans, :document
  end

  def self.down
    remove_attachment :loans, :document
  end
end
