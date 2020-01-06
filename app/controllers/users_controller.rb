class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user] = @user
			redirect_to @user
		else
			render 'new'
		end
	end

	def signin_show
		render 'signin'
	end

	def signin
		@user = User.find_by(username: user_params[:username])
		if @user
			session[:user] = @user
			redirect_to articles_path
		else
			render 'signin'
		end
	end

	private 
		def user_params
			params.require(:user).permit(:name, :username)
		end

end
