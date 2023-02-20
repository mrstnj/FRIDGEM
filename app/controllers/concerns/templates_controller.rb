class TemplatesController < ActionController::Base
def get_body
  @food_stock = FoodStock.find(params[:template_id])
  @template_body = @food_stock.price
  respond_to do |format|
    format.js
  end
end
end