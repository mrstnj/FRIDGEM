class FoodConsumesController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user

  def new
    # 新しい消費食材を作成する
    @user = User.find(params[:user_id])
    @food_consume = FoodConsume.new
  end

  def create
    # 消費食材を在庫テーブルから取得する
    @food_stock = FoodStock.find(params[:food_consume][:food_stock_id])

    # 在庫テーブルの数量を消費分マイナスする
    consume_quantity = params[:food_consume][:consume_quantity]
    stock_quantity = @food_stock.stock_quantity.rationalize - consume_quantity.to_f.rationalize
    stock_quantity = stock_quantity.to_f

    # 消費テーブルに登録する
    @food_consume = current_user.food_consumes.build(food_params)

    # 登録・更新できれば画面遷移する
    if @food_consume.save && stock_quantity >= 0
      @food_stock.update_attribute(:stock_quantity, stock_quantity)
      redirect_to user_calender_path
    else
      redirect_to new_user_food_consume_path, status: :unprocessable_entity
    end
  end

  def index
    # 全消費食材を取得する
    @food_consumes = FoodConsume.where("user_id = ?", params[:user_id])
  end

  def edit
    # 更新する在庫食材を特定する
    @user = User.find(params[:user_id])
    @food_consume = FoodConsume.find(params[:id])
  end

  def update
    # 更新する在庫食材を特定する
    @food_consume = FoodConsume.find(params[:id])

    # 更新できれば画面遷移する
    if @food_consume.update(food_params)
      redirect_to user_food_consumes_path
    else
      redirect_to 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    food_consume = FoodConsume.find(params[:id])
    if food_consume.user_id == current_user.id
      food_consume.destroy #destroyメソッドを使用し対象のツイートを削除する。
      redirect_to user_food_consumes_path, status: :see_other
    else
      redirect_to user_food_consumes_path, status: :unprocessable_entity
    end
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
