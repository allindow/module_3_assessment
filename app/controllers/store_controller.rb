class StoreController < ApplicationController

  def show
    @store = Stores.store_info(params[:id])
  end

end
