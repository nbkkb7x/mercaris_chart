class CreateCharts < ActiveRecord::Migration[7.0]
  def change
    create_table :charts do |t|
      t.contract :string
      t.transaction_date :string
      t.quantity :string
      t.price :decimal

      t.timestamps
    end
  end
end
