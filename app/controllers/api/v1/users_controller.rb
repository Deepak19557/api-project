class Api::V1::UsersController < ApplicationController
  def index
  	@users = User.all 
  	render json: @users  
  end

  def create
  	@user = User.create(user_params)
  	if @user.save 
  		render json: @user, status: :created 
  	end
  end 

  def show 
  	@user = User.find(params[:id])
  	render json: @user 
  end 

  def update 
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		render json: @user 
  	end
  end 

  def destroy 
  	@user = User.find(params[:id])
  	@user.destroy 
  end
	
	private 
	
	def user_params
		params.permit(:id, :email, :name, :age, :phone)
	end
end