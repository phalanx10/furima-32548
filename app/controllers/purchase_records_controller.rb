class PurchaseRecordsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @address_record = AddressRecord.new
  end

  def create
    binding.pry
    @item = Item.find(params[:item_id])
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
    
end
