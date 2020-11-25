class UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).per(3)
    
  end
  
  def show
    @user = User.find(params[:id])
    @lists = @user.lists
  end

  def edit
    # @users = User.all
    if @user == current_user
      @user = User.find(params[:id])
        render :edit
      else
        @user = current_user
        render :edit
      end
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     flash[:notice] = "successfully"
       redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def delete
  	
  end

  private

  def user_params
  	params.require(:user).permit(:name, :profile_image_id, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    # redirect_to user_path(current_user.id) unless params[:id] == cur÷rent_user.id
    redirect_to(user_url(current_user)) unless @user == current_user

  end



end
