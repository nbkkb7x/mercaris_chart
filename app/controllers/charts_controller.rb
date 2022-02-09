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
    # VWAP = (Sum(Qty * Price) / Sum(Qty)) I'm not sure I did this right
    @total = Trade.group_by_week(:transaction_date).sum(:total)
    @grouped_quantities = Trade.group_by_week(:transaction_date).sum(:quantity)

    vwaps = @grouped_quantities.zip(@total).map do |quantity, total|
      vwap = if quantity[1] == 0 # avoids division by zero
        0
      else
        [
          total[1] / quantity[1]
        ]
      end

      [
        quantity[0],
        vwap
      ]
    end
    render json: vwaps
  end

  def volume_weighted_price_by_month_trades
    # #VWAP = (Sum(Qty * Price) / Sum(Qty)) I'm not sure I did this right
    @total = Trade.group_by_month(:transaction_date).sum(:total)
    @grouped_quantities = Trade.group_by_month(:transaction_date).sum(:quantity)

    vwaps = @grouped_quantities.zip(@total).map do |quantity, total|
      vwap = if quantity[1] == 0 # avoids division by zero
        0
      else
        [
          total[1] / quantity[1]
        ]
      end

      [
        quantity[0],
        vwap
      ]
    end
    render json: vwaps
  end

end
