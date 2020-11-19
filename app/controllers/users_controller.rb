class UsersController < ApplicationController
  def index
    
  end
  
  def show
		
  end


  def create
		
  end

  def edit
  	
  end



  def update
  	
  end

  def delete
  	
  end

  private

  def user_params
  	params.require(:user).permit(:nema, :profile_image_id, :introduction)
  end



end
