class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def show
    @category = Category.find(params[:id])
    @events = Event.where(category_id: params[:id])
  end
end
