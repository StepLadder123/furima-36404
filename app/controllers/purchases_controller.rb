class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!
  before_action :move_to_index, only: [:index, :create]

  def index
    @purchase_ship_address = PurchaseShipAddress.new
  end
  
  def create
    @purchase_ship_address = PurchaseShipAddress.new(purchase_params)
    user = User.find(@item.user_id)
    if @purchase_ship_address.valid?
      pay_item
      @purchase_ship_address.save
      user.sell_count += 1
      user.save
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

  def move_to_index
    if current_user.id == @item.user.id || @item.purchase.present?
      redirect_to root_path
    end
  end
end
