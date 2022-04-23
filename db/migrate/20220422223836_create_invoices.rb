class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.string :customer
      t.string :status, :default => "NEW"
      t.timestamps
    end
  end
end
