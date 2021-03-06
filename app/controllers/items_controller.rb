class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_signed_in, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :search_item, only: [:search, :search_result]
  
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
    gon.currentUserSellCount = current_user.sell_count
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
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
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

  def search
    @items = Item.all
  end

  def search_result
    @results = @i.result
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

  def search_item
    @i = Item.ransack(params[:q])
  end

  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :status_id, :ship_fee_id, :ship_area_id, :ship_schedule_id, :price).merge(user_id: current_user.id)
  end
end
