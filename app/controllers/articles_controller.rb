class ArticlesController < ApplicationController

	def index
		@articles = Article.all
		@user = current_user
	end

	def show
		@article = Article.find(params[:id])
		@user = current_user
	end

	def new
		@article = Article.new
		@user = current_user
	end

	def edit
		@article = Article.find(params[:id])
		@user = current_user
	end

	def create
		@article = Article.new(article_params)
		@user = current_user

		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def update
		@user = current_user
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@user = current_user
		Article.find(params[:id]).destroy
		redirect_to articles_path
	end

	private
		def article_params
			params.require(:article).permit(:title, :text)
		end
end
