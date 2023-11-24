class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      # Redirect to the categories list with a success message
      redirect_to [:admin, :categories], notice: 'Category was successfully created.'
    else
      # Re-render the new template with error messages
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name) # adjust attributes as needed
  end
end
