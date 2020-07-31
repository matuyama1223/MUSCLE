class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :baria_user, only: [:edit, :update]

  def index
    #@muscle = Muscle.find(params[:id])
    @users = User.page(params[:page]).reverse_order
    @user = current_user
        if params[:search].present?
      @users = User.where(name: params[:search])

      if params[:name].present?
      @users = @users.get_by_name params[:name]
      end
      else
end
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
  if @user.update(user_params)
      # flash[:notice]=
      redirect_to user_path(@user)
  else
    render'edit'
  end
 end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to new_user_registration_path
  end

  def follows
    @user = User.find(params[:user_id])
  end

  def follower
    @user = User.find(params[:user_id])
  end

private

  def user_params
    params.require(:user).permit(:name,:user_image)
  end

  def baria_user
    unless params[:id].to_i == current_user.id
      redirect_to user_path(current_user)
    end
  end

end
