class StocksController < ApplicationController

  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        @stock_brokers = @stock.brokers
        respond_to do |format|
          format.js { render partial: 'users/result'}
        end
        

      else
        respond_to do |format|
          flash.now[:alert] = "Please enter a valid symbol to search."
          format.js { render partial: 'users/result'}
        end
      end

    else
      respond_to do |format|
        flash.now[:alert] = "Please enter a symbol to search."
        format.js { render partial: 'users/result'}
      end
    end

  end

  # def stock_brokers
  #   stock = Stock.find(params[:id])
  #   @stock_brokers = stock.brokers
  # end

end
