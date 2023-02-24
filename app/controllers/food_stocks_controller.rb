class FoodStocksController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user

  def new
    # 新しい在庫食材を作成する
    @user = User.find(params[:user_id])
    @food_stock = FoodStock.new
  end

  def create
    # 在庫テーブルに登録する
    @food_stock = current_user.food_stocks.build(food_params)

    # 登録できれば画面遷移する
    if @food_stock.save
      flash[:success] = "Food created!"
      redirect_to user_food_stocks_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def index
    # ユーザの在庫食材を取得する
    @food_stocks = FoodStock.where("user_id = ?", params[:user_id])
  end

  def edit
    # 更新する在庫食材を特定する
    @user = User.find(params[:user_id])
    @food_stock = FoodStock.find(params[:id])
  end

  def update
    # 更新する在庫食材を特定する
    @food_stock = FoodStock.find(params[:id])

    # 更新できれば画面遷移する
    if @food_stock.update(food_params)
      flash[:success] = "Food updated!"
      redirect_to user_food_stocks_path
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  private

    # 許可済みパラメータを指定する
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
