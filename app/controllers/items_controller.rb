class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_signed_in, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  
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
  end
  
  def edit
  end
  
  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private
  
  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_signed_in
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
  end

  def move_to_index
    if current_user.id != @item.user.id || @item.purchase.present?
      redirect_to action: :index
    end
  end

  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :status_id, :ship_fee_id, :ship_area_id, :ship_schedule_id, :price).merge(user_id: current_user.id)
  end
end
