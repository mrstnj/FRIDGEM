class TemplatesController < ActionController::Base
def get_body
  @food_stock = FoodStock.find(params[:template_id])
  @price = @food_stock.price
  @consume_quantity = @food_stock.stock_quantity
  respond_to do |format|
    format.js
  end
end
end