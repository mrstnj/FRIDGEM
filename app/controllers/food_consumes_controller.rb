class FoodConsumesController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user

  def new
    @user = User.find(params[:user_id])
    @food_stocks = FoodStock.all
    @food_consume = FoodConsume.new
  end

  def create
    # 消費食材を在庫テーブルから取得する
    @food_stock = FoodStock.find(params[:food_consume][:name])

    # 在庫テーブルの数量を消費分マイナスする
    consume_quantity = params[:food_consume][:consume_quantity]
    stock_quantity = @food_stock.stock_quantity - consume_quantity.to_i

    # 消費テーブルに登録する
    @food_consume = current_user.food_consumes.build(food_params)

    # 保存・更新できれば画面遷移する
    if @food_consume.save && @food_stock.update_attribute(:stock_quantity, stock_quantity)
      flash[:success] = "Food created!"
      redirect_to user_food_consumes_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def index
    @food_consumes = FoodConsume.all
  end

  private

    def food_params
      params.require(:food_consume).permit(:name, :price, :consume_quantity, :start_time, :note)
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
