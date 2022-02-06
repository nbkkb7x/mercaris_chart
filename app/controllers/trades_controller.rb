class TradesController < ApplicationController
  def index
    @pagy, @trades = pagy(Trade.all)

    respond_to do |format|
      format.html
    end
  end
end
