class ArticlesController < ApplicationController
  def index
    @articles = admin? ? Article.latest : Article.published.latest
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    
    if @article.save
      redirect_to root_path, notice: t("article.created_successfully")
    else
      render :index
    end
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    
    if @article.update(article_params)
      redirect_to root_path, notice: t("article.updated_successfully")
    else
      render :index
    end
  end
  
  private
  
    def article_params
      params.require(:article).permit(:title, :body, :published, :published_at)
    end
end
