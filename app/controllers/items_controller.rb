class ItemsController < ApplicationController
  before_action :move_to_signin, except: [:index]
  def index
  end

  def new
    @item = Item.new
  end

  def move_to_signin
    unless user_signed_in?
      authenticate_user!
    end
  end
end
