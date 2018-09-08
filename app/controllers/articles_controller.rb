class ArticlesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show, :more]


    def index
        @new_articles = Article.all.order(created_at: :desc).limit(3)
        @articles = Article.all.order(created_at: :desc).limit(6)
    end

    def new 
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)

        if @article.save
            redirect_to root_path, notice: "記事の投稿に成功しました"
        else
            render "new"
        end
    end

    def show
        @article = Article.find(params[:id])
        @next_article = @article.next
        @previous_article = @article.previous
        @similar_articles = @article.category.articles.where("id != ?", @article.id).limit(3)
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])

        if @article.update(article_params)
            redirect_to @article, notice: "記事を更新しました"
        else
            render "edit"
        end
    end

    def destroy
        @article = Article.find(params[:id])
        if @article.destroy
            redirect_to root_path, notice: "記事を削除しました"
        else
            render @article
        end
    end

    def more
        @articles = Article.paginate(page: params[:page], per_page: 9).order(created_at: :desc)
    end

    private

        def article_params
            params.require(:article).permit(:thumbnail, :title, :content, :category_id).merge(user_id: current_user.id)
        end

end
