def volume_weighted_price_by_week_trades
  #VWAP = (Sum(Qty * Price) / Sum(Qty))

  binding.pry
  grouped_price = Trade.group_by_week(:transaction_date).sum(:price)
  grouped_quantity = Trade.group_by_week(:transaction_date).sum(:quantity)
  grouped_price_volume = grouped_price.each do |x|
    grouped_price_volume[x] = grouped_price[x] / grouped_quantity[x]
  end

  grouped_price_volume = grouped_price.values * grouped_quantity.values
  vwap = grouped_price_volume % grouped_quantity
  render json: vwap
end