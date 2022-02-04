class AddTradeFilenametoRecord < ActiveRecord::Migration[7.0]
  def change
    add_column :trades, :trade_filename, :string
  end
end
