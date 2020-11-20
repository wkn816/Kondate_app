class ListsController < ApplicationController


  def index
    @lists = List.all
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    @list.save
    redirect_to lists_path
  end

  def show
		@user = User.find(params[:id])
    @lists = @user.lists
  end

  def edit
    if @book.user_id == current_user
      @book = Book.find(params[:id])
        render :edit
      else
        @book.user = current_user
        render :edit
      end
  end

  def update
  	
  end

  def delete
  	
  end

private

  def list_params
    params.require(:list).permit(:body)
  end

  def correct_user
    @book = Book.find(params[:id])
    # redirect_to user_path(current_user.id) unless params[:id] == cur÷rent_user.id
    redirect_to(books_url) unless @book.user == current_user

  end
end