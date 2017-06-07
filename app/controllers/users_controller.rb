class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def my_friends
    @users_all = User.all
    @users =current_user.friends_where_sender
  end

  def go_to_user
    @user=params[:follows]

    @find=User.find_by(:username => @user)
    @string="/users/"+ @find.id.to_s
    redirect_to(@string)
  end

  def show
    @user = User.find(params[:id])
  end
end
