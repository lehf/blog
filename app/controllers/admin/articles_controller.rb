class Admin::ArticlesController < Admin::BaseController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.create(article_params)
    if @article.save
      redirect_to admin_articles_index_path
    else
      flash[:notice=>"check"]
      render :new
    end
  end


  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to admin_articles_path
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      redirect_to admin_articles_index_path
    end
  end

  private
  def article_params
    params.require(:article).permit(:title,
                                    :subtitle,
                                    :content,
                                    :image,
                                    :seo_title,
                                    :seo_keywords,
                                    :seo_description

    )

  end
end
