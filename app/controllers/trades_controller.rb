class TradesController < ApplicationController
  def index
    @trades = Trade.all

    respond_to do |format|
      format.html
    end
  end
end
