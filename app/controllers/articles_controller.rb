class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  def index
    #@articles = Article.page(params[:page]).reverse_order
    @articles = Article.find(Favorite.group(:article_id).order('count(article_id) desc').limit(5).pluck(:article_id))
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def edit
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
  
  def search
    @articles = Article.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end