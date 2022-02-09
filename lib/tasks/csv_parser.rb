require 'csv'

# Reads Trade CSV File & Saves into Trade Record
Dir[Rails.root.to_s + "/lib/tasks/mercaris_sample_data**csv"].each do |file| 
  CSV.parse(File.read(file), headers: true, col_sep: ",", encoding: "ISO-8859-1") do |row|
    #TODO Fix Date Format- might want to refractor a way to not malform the date before raw_data is saved
    month, day, year = row["transaction_date"].split("/")
    correct_date = month, day, "20" + year
    row["transaction_date"] = Date.strptime(correct_date.join("/"), "%m/%d/%Y")
    Trade.create(
      contract: row["contract"],
      transaction_date: row["transaction_date"],
      quantity: row["quantity"].to_i,
      price: row["price (USD)"].to_f,
      total: row["quantity"].to_i * row["price (USD)"].to_f,
      trade_filename: File.basename(file),
      raw_data: row.to_hash
      )
    end
end
puts "There are now #{Trade.count} rows in the Trade table"
 

