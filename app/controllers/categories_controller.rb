class CategoriesController < ApplicationController
  before_action :logged_in_user, :verify_normal

  def index
    @categories = Category.paginate page: params[:page], per_page:5
  end

  def show
    @category = Category.find params[:id]
  end
end
