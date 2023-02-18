class FoodStocksController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user

  def new
    @user = User.find(params[:user_id])
    @foodstock = FoodStock.new
  end

  def create
    @foodstock = current_user.foods.build(food_params)
    if @foodstock.save
      flash[:success] = "Food created!"
      redirect_to user_food_stocks_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def index
    @food_stocks = FoodStock.where("user_id = ?", params[:user_id])
  end

  private

    def food_params
      params.require(:food_stock).permit(:name, :price, :stock_quantity, :order_date)
    end

    # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url, status: :see_other
      end
    end

    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:user_id])
      redirect_to(root_url, status: :see_other) unless current_user?(@user)
    end
end
