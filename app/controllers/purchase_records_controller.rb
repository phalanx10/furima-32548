class PurchaseRecordsController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_signin
  before_action :move_to_index
  
  def index
    @address_record = AddressRecord.new
  end

  def create
    @address_record = AddressRecord.new(address_record_params)
    if @address_record.valid?
      pay_item
      @address_record.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def address_record_params
    params.require(:address_record).permit(:post_code, :prefecture, :city, :address, :building_name, :phone_number,:purchase_record_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_signin
    authenticate_user! unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if @item.purchase_record.present?
      redirect_to root_path
    elsif current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: address_record_params[:token],
      currency: 'jpy'
    )
  end

end
