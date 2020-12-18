class PurchaseRecordsController < ApplicationController
  before_action :move_to_signin
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index
  def index
    @address_record = AddressRecord.new
  end

  def create
    #binding.pry
    @address_record = AddressRecord.new(address_record_params)
    if @address_record.valid?
      @address_record.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def address_record_params
    params.require(:address_record).permit(:post_code, :prefecture, :city, :address, :building_name, :phone_number,:purchase_record_id, :user_id, :item_id)
  end

  def move_to_signin
    authenticate_user! unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user.id
  end 
end
