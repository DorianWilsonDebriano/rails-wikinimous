class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = before_action
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_path
  end

  def edit
    @article = before_action
  end

  def update
    @article = before_action
    @article.update(article_params)
    redirect_to article_path
  end

  def destroy
    @article = before_action
    @article.destroy
    redirect_to articles_path
  end

  def before_action
    Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
