class ChartsController < ApplicationController
  
  def count_by_week_trades
    render json: Trade.group_by_week(:transaction_date).count
  end

  def count_by_month_trades
    render json: Trade.group_by_month(:transaction_date).count
  end

  def average_price_by_week_trades
    render json: Trade.group_by_week(:transaction_date).average(:price)
  end

  def average_price_by_month_trades
    render json: Trade.group_by_month(:transaction_date).average(:price)
  end

  def volume_weighted_price_by_week_trades
    # #VWAP = (Sum(Qty * Price) / Sum(Qty))
    # @grouped_price = Trade.group_by_week(:transaction_date).sum(:price)
    # @grouped_quantity = Trade.group_by_week(:transaction_date).sum(:quantity)
    # vwap = @grouped_price.values.each do |x|
    #   @grouped_price[x] = @grouped_price[x] / @grouped_quantity[x]
    
    # grouped_price_volume = grouped_price.each do |x|
    #   grouped_price_volume[x] = grouped_price[x] / grouped_quantity[x]
    # end

    # grouped_price_volume = grouped_price.values * grouped_quantity.values
    # vwap = grouped_price_volume % grouped_quantity
    # render json: vwap
  end

  def volume_weighted_price_by_month_trades
  end

end
