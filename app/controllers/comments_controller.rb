class CommentsController < ApplicationController
  before_action :get_article
  before_action :get_comment, only: [:show, :destroy, :update, :edit]

  def index
    @comments = @article.comments.order(created_at: :desc)
  end

  def new
    @comment = @article.comments.build
  end

  def create
    @comment = @article.comments.build comment_params

    if @comment.save
      redirect_to article_comments_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @comment.update comment_params
      redirect_to article_comments_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
    @comment.destroy
    redirect_to article_comments_path
  end

  private

  def get_article
    @article = Article.find params[:article_id]
  end

  def comment_params
    params.require(:comment).permit(:body, :article_id)
  end

  def get_comment
    @comment = @article.comments.find params[:id]
  end
end
