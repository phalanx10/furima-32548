class ItemsController < ApplicationController
  before_action :move_to_signin, except: [:index, :show]
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

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :image, :description, :price, :status_id, :delivery_day_id, :shipping_area_id, :delivery_fee_id, :category_id).merge(user_id: current_user.id)
  end

  def move_to_signin
    authenticate_user! unless user_signed_in?
  end
end
