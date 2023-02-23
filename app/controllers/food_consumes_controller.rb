class FoodConsumesController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user

  def new
    # 新しい消費食材を作成する
    @user = User.find(params[:user_id])
    @food_consume = FoodConsume.new

    # プルダウン用に在庫食材を取得する
    @food_stocks = FoodStock.all
  end

  def create
    # 消費食材を在庫テーブルから取得する
    @food_stock = FoodStock.find(params[:food_consume][:food_stock_id])

    # 在庫テーブルの数量を消費分マイナスする
    consume_quantity = params[:food_consume][:consume_quantity]
    stock_quantity = @food_stock.stock_quantity - consume_quantity.to_i

    # 消費テーブルに登録する
    @food_consume = current_user.food_consumes.build(food_params)

    # 登録・更新できれば画面遷移する
    if @food_consume.save && @food_stock.update_attribute(:stock_quantity, stock_quantity)
      flash[:success] = "Food created!"
      redirect_to user_calender_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def index
    # 全消費食材を取得する
    @food_consumes = FoodConsume.where("user_id = ?", params[:user_id])
  end

  def calender
    # 全消費食材を取得する
    @food_consumes = FoodConsume.where("user_id = ?", params[:user_id])
  end

  private

    # 許可済みパラメータを指定する
    def food_params
      params.require(:food_consume).permit(:food_stock_id, :consume_quantity, :start_time, :note)
    end

    # ログイン済みユーザーかどうか確認する
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url, status: :see_other
      end
    end

    # 正しいユーザーかどうか確認する
    def correct_user
      @user = User.find(params[:user_id])
      redirect_to(root_url, status: :see_other) unless current_user?(@user)
    end
end
