class FoodsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user

  def new
    @user = User.find(params[:user_id])
    @food = Food.new
  end

  def create
    @food = current_user.foods.build(food_params)
    if @food.save
      flash[:success] = "Food created!"
      redirect_to user_foods_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def index
    @foods = Food.where("user_id = ?", params[:user_id])
  end

  private

    def food_params
      params.require(:food).permit(:name, :price, :quantity, :order_date)
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
