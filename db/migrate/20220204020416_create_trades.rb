class CreateTrades < ActiveRecord::Migration[7.0]
  def change
    create_table :trades do |t|
      t.string :contract
      t.date :transaction_date
      t.integer :quantity
      t.decimal :price

      t.timestamps
    end
  end
end
