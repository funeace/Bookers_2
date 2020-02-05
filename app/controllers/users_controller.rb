class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
  end

  def show
    # 他人のページにも遷移させることがあるため、current_userではなくparams[:id]
    @user = User.find(params[:id])
    @book = Book.new

    #find_by findだと自分のid user_idに紐づける
    #booksはmodelで指定したhas_manyの値
    @books = @user.books
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    user = User.find(current_user.id)
    user.update(user_params)
    redirect_to user_path(current_user.id)
  end

private
  #更新する項目　:name :profile_image :introduction
  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end
end


