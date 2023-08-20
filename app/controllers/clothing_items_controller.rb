class ClothingItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  #GET /clothing_items
  def index
    @clothing_items = ClothingItem.all
    render json: { clothing_items: @clothing_items }
  end

    #GET /clothing_items/1
  def show
    @clothing_item = ClothingItem.find(params[:id])
    render json: { clothing_item: @clothing_item }
  end

  def create
    @clothing_item = ClothingItem.new(clothing_item_params)

    if @clothing_item.save
      render json: @clothing_item, status: :created
    else
      render json: { errors: @clothing_item.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @clothing_item.update(clothing_item_params)
      render json: @clothing_item
    else
      render json: { errors: @clothing_item.errors }, status: :unprocessable_entity
    end
  end
  def destroy
  end

  def add_to_favorites
  end

  def make_reservation
  end

  def make_payment
  end

  def rate
  end

  private

  def set_clothing_item
    @clothing_item = ClothingItem.find(params[:id])
  end

  def clothing_item_params
    params.require(:clothing_item).permit(:name, :description, :price, :color :category_id, :picture)
  end
end
