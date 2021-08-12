class ItemsController < ApplicationController
  before_action :move_to_signed_in, except: [:index]
  
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
  def move_to_signed_in
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
  end

  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :status_id, :ship_fee_id, :ship_area_id, :ship_schedule_id, :price).merge(user_id: current_user.id)
  end
end
