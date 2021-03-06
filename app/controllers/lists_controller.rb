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
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
    if @list.user_id == current_user
       redirect_to edit_list_path(@list)
    else
       @list.user = current_user
       render :edit
    end
  end

  def update
  	@list = List.find(params[:id])
    if @list.update(list_params)
       flash[:notice] = "successfully"
       redirect_to lists_path
    else
       render :edit
    end
  end

  def destroy
  	@list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

private

  def list_params
    params.require(:list).permit(:body)
  end

  def correct_user
    @book = Book.find(params[:id])
    redirect_to(books_url) unless @book.user == current_user
  end
end