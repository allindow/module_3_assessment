class StoreController < ApplicationController

  def show
    require "pry"; binding.pry
    @store = Stores.store_info(params[:id])
  end

end
