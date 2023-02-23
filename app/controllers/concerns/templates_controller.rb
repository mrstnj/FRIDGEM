class TemplatesController < ActionController::Base
  # 選択された在庫食材の金額・数量を取得する
  def get_body
    @food_stock = FoodStock.find(params[:template_id])
    @price = @food_stock.price
    @consume_quantity = @food_stock.stock_quantity
    respond_to do |format|
      format.js
    end
  end
end