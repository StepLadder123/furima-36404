class ItemsController < ApplicationController
  before_action :move_to_signed_in, except: [:index]
  
  def index
    
  end

  def new
    
  end

  private
  def move_to_signed_in
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
  end
end
