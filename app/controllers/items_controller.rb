class ItemsController < ApplicationController
  before_action :move_to_signin, except: [:index]
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :image, :description, :price, :status_id, :delivery_days_id, :shipping_area_id, :delivery_fee_id, :categories_id).merge(user_id: current_user.id)
  end

  def move_to_signin
    authenticate_user! unless user_signed_in?
  end
end
