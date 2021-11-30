class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    authorize @category
    @events = @category.events
  end
end
