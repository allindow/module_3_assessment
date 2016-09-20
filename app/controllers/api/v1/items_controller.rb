class Api::V1::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    if item.delete
      render status: 204
    end
  end

  def create
    @item = Item.create(item_params)
    render 'api/v1/items/show', status: 201
  end

  private
    def item_params
      params.permit(:name, :description, :image_url)
    end
end
