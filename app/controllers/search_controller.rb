class SearchController < ApplicationController

  def index
    @stores = Stores.stores_by_zip(params[:zip])
  end
end
