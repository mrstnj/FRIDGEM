class FoodConsumesController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user

  def new
    @user = User.find(params[:user_id])
    @food_stocks = FoodStock.all
    @food_consume = FoodConsume.new
  end

  def create
    @food_consume = current_user.food_consumes.build(food_params)
    if @food_consume.save
      flash[:success] = "Food created!"
      redirect_to user_food_stocks_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

    def food_params
      params.require(:food_consume).permit(:name, :price, :consume_quantity, :consume_date, :note)
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
