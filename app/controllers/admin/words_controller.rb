class Admin::WordsController < Admin::ApplicationController

  def index
    @categories = Category.all
    if params[:category_id]
      @words = Word.category_id(params[:category_id])
    else
      @words = Word.all
    end

    if params[:type]
      @words = @words.send(params[:type])
    end

    @words = @words.paginate page: params[:page], per_page: 5
  end

  def destroy
    Word.find(params[:id]).destroy
    redirect_to admin_words_url
  end

  def new
    @category = Category.find_by(id: params[:category_id])
    @word = @category.words.build
    @word.answers.build
  end

  def create
    @category = Category.find_by(id: params[:category_id])
    @word = @category.words.build word_params
    if @word.save
      flash[:success] = "Word was added successfully"
      redirect_to admin_category_url(@category)
    else
      flash[:danger] = "Word was not added"
      render :new
    end
  end

  private

  def word_params
    params.require(:word).permit :name, answers_attributes: [:id, :name, :is_correct, :_destroy]
  end
end
