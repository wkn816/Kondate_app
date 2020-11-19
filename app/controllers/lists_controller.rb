class ListsController < ApplicationController


  def index
    @list = List.new
    @lists = List.all
  end

  def create
    @list = List.new(list_params)
    # @list.user_id = current_user.id
    @list.save
    redirect_to lists_path
  end

  def show
		
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