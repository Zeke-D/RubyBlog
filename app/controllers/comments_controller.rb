class CommentsController < ApplicationController

	def create
		@user = current_user
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(comment_params)
		redirect_to article_path(@article)
	end

	def destroy
		@user = current_user
		@article = Article.find(params[:article_id])
		@article.comments.find(params[:id]).destroy
		redirect_to article_path(@article)
	end

	private
		def comment_params
			params.require(:comment).permit(:commenter, :body)
		end
end
