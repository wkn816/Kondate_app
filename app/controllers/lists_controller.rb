class ListsController < ApplicationController
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

  def list_params
  	params.require(:list).permit(:body)
  end


end
