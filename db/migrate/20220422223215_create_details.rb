class CreateDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :details do |t|
      t.string :name
      t.integer :price
      t.integer :total
      t.string :invoice_id

      t.timestamps
    end
  end
end
