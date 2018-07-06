class ArticlesController < ApplicationController

	def index
		if user_signed_in?
			@article = Article.where(:user_id => current_user.id.to_i).all
		end
	end

  def new
		@article = Article.new
		@user = User.find(current_user.id)
	end
	def create
		@user = User.find(params[:user_id])
		@article = @user.articles.create(params.require(:article).permit(:title, :text))
		if @article.nil?
			redirect_to new_user_article_path
		else
			redirect_to user_articles_path
		end
	end

	def destroy
		@user = User.find(params[:user_id])
		@article = @user.articles.find(params[:id])
		@article.destroy
		redirect_to user_articles_path
	end

end
