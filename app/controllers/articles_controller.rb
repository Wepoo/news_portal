class ArticlesController < ApplicationController

  autocomplete :tag, :name, :class_name => 'ActsAsTaggableOn::Tag'

  before_action :set_article, only: [:show, :edit, :update, :destroy]

  helper_method :sort_column, :sort_direction, :certificates_sort_column, :certificates_sort_direction
  # before_action :set_commentator, only: :show
  # GET /articles
  # GET /articles.json
  def index
    if params[:tag]
      @articles = Article.tagged_with(params[:tag]).order(sort_column + ' ' + sort_direction)
    else
      @articles = Article.tagged_with(params[:tag]).order(sort_column + ' ' + sort_direction)
      if current_user
        @articles = Article.published.order(sort_column + ' ' + sort_direction)
      else
        @articles = Article.published.hidden.order(sort_column + ' ' + sort_direction)
      end
    end
  end

  def suggested
    @articles = Article.where(published: false)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    if current_user
      @comment = Comment.build_from( @article, @current_user.id, "" )
    end
    @all_comments = @article.comment_threads

    @visits = Ahoy::Event.where("properties->>'id' = '#{params[:id]}' AND name = 'Processed articles#show'").count
  end

  # GET /articles/new
  def new
    @article = Article.new()

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /articles/1/edit
  def edit
    @article.published = true
    @article.save

    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Article was successfully deleted.' }
      format.json { head :no_content }
      format.js
    end
  end

  def certificates_sort_column
    %w[articles.rating articles.title created_at].include?(params[:order]) ? params[:order] : 'created_at'
  end

  def certificates_sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'desc'
  end

  def sort_column
    %w[articles.title created_at articles.rating].include?(params[:order]) ? params[:order] : 'created_at'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'desc'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :full_text, :description, :user_id, :category_id, :hidden, :access_to_description, :content, :name, :tag_list)
    end

end
