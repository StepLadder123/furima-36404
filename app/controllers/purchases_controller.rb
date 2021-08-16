class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_ship_address = PurchaseShipAddress.new
  end
  
  def create
    @purchase_ship_address = PurchaseShipAddress.new(purchase_params)
    if @purchase_ship_address.valid?
      pay_item
      @purchase_ship_address.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private
  
  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def purchase_params
    params.require(:purchase_ship_address).permit(:postal_code, :prefecture_id, :city, :address, :build_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
