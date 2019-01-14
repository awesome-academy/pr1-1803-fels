class Admin::CategoriesController < Admin::ApplicationController
  before_action: load_category, except: [:index]
  def index
    @categories = Category.paginate page: params[:page], per_page: 5
  end

  def show
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = "Category was updated"
      redirect_to admin_categories_url
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    flash[:success] = "#{@category.name} was deleted"
    redirect_to admin_categories_url
  end

  private
  def category_params
    params.require(:category).permit :name
  end
  def load_category
    @category = Category.find params[:id]
  end
end
