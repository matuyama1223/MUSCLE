class UsersController < ApplicationController
  def index
    #@muscle = Muscle.find(params[:id])
    @users = User.all
    @user = current_user
  end

  def show
    @user =User.find(params[:id])
    #         検索エンジンカラム名↓　検索ワード↓　　
    @muscles = Muscle.where(user_id: @user.id)
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
   @user = User.find(params[:id])
   @user.update(user_params)
   redirect_to user_path(@user)
 end

 def destroy
  @user = User.find(params[:id])
  @user.destroy
  redirect_to new_user_registration_path
end

def follows
  user = User.find(params[:id])
  @users = current_user.followings
end

def follower
  user = User.find(params[:id])
  @users = current_user.followers
end

private
def user_params
 params.require(:user).permit(:name,:user_image)
end

end
