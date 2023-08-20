class ClothingItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_clothing_item, only: [:show, :update, :destroy, :add_to_favorites, :make_reservation, :make_payment, :rate]

  # GET /clothing_items
  def index
    @clothing_items = ClothingItem.all
    render json: { clothing_items: @clothing_items }
  end

  # GET /clothing_items/1
  def show
    render json: { clothing_item: @clothing_item }
  end

  # POST /clothing_items
  def create
    @clothing_item = ClothingItem.new(clothing_item_params)

    if @clothing_item.save
      render_created_item
    else
      render json: { errors: @clothing_item.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clothing_items/1
  def update
    if @clothing_item.update(clothing_item_params)
      render json: @clothing_item
    else
      render json: { errors: @clothing_item.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /clothing_items/1
  def destroy
    @clothing_item.destroy
    render json: { message: 'Clothing item deleted successfully' }
  end

  # POST /clothing_items/1/add_to_favorites
  def add_to_favorites
    favorite = Favorite.new(user_id: current_user.id, clothing_item_id: params[:clothing_item_id])
  
    if favorite.save
      render json: { message: 'Added to favorites successfully' }
    else
      render json: { errors: favorite.errors }, status: :unprocessable_entity
    end
  end
  

  # POST /clothing_items/1/make_reservation
def make_reservation
  clothing_item = ClothingItem.find(params[:id])
  reserved_amount = clothing_item.price / 2  # Half of the clothing item's price

  reservation = Reservation.new(
    user_id: current_user.id,
    clothing_item_id: params[:id],
    payment_status: 'pending',  # Initial status, assuming payment hasn't been made yet
    reserved_amount: reserved_amount
  )

  if reservation.save
    render json: { message: 'Reservation created successfully', reservation: reservation }
  else
    render json: { errors: reservation.errors }, status: :unprocessable_entity
  end
end



# POST /clothing_items/1/rate
def rate
  clothing_item = ClothingItem.find(params[:id])
  existing_rating = Rating.find_by(user_id: current_user.id, clothing_item_id: clothing_item.id)

  if existing_rating
    render json: { error: 'You have already rated this item' }, status: :unprocessable_entity
    return
  end

  rating_value = params[:value].to_i

  if rating_value < 1 || rating_value > 10
    render json: { error: 'Rating value must be between 1 and 10' }, status: :unprocessable_entity
    return
  end

  rating = Rating.new(
    user_id: current_user.id,
    clothing_item_id: clothing_item.id,
    value: rating_value
  )

  if rating.save
    average_rating = Rating.where(clothing_item_id: clothing_item.id).average(:value)
    render json: { message: 'Rating added successfully', rating: rating, average_rating: average_rating }
  else
    render json: { errors: rating.errors }, status: :unprocessable_entity
  end
end



  private

  def set_clothing_item
    @clothing_item = ClothingItem.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Clothing item not found' }, status: :not_found
  end

  def render_created_item
    render json: { clothing_item: @clothing_item }, status: :created
  end

  def clothing_item_params
    params.require(:clothing_item).permit(:name, :description, :price, :color, :category_id, :picture)
  end
end
