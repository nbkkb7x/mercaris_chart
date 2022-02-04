class AddTradeRawJsonb < ActiveRecord::Migration[7.0]
  def change
    add_column :trades, :raw_data, :jsonb, null: false, default: {}
  end
end
