class Admin::CategoriesController < Admin::ApplicationController

  def index
    @categories = Category.paginate page: params[:page], per_page: 5
  end

  def show
    @category = Category.find params[:id]
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    flash[:success] = "#{category.name} was deleted"
    redirect_to admin_categories_url
  end  
end
