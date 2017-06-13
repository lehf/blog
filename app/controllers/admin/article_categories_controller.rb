class Admin::ArticlesController < Admin::BaseController
  def index
    @article_categories = ArticleCategory.all.page(params[:page]).per(10)
  end

  def new
    @article_category = ArticleCategory.new
  end

  def show
    @article_category = ArticleCategory.find(params[:id])
  end

  def create
    @article_category = ArticleCategory.create(article_params)
    if @article_category.save
      redirect_to admin_article_category_path
    else
      flash[ :notice=>"check" ]
      render :new
    end
  end


  def edit
    @article_category = ArticleCategory.find(params[:id])
  end

  def update
    @article_category = ArticleCategory.find(params[:id])
    if @article_category.update(article_params)
      redirect_to admin_articles_path
    else
      render :edit
    end
  end

  def destroy
    @article_category = ArticleCategory.find(params[:id])
    if @article_category.destroy
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
