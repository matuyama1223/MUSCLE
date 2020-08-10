class MusclesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user,only:[:edit]

	def index
					# じゃなかったら＝present?
		@muscles = if params[:genre].present?
			         Muscle.where(muscle_genre: params[:genre]).page(params[:page]).reverse_order
			         # 違ったらした
			       else
			      	 Muscle.page(params[:page]).reverse_order
			       end
		@user =  current_user
		@users = User.all
	end

	def new
		@muscle = Muscle.new
	end

	def edit
		@muscle = Muscle.find(params[:id])
	end

	def show
		@muscle = Muscle.find(params[:id])
		@muscle_comments = MuscleComment.new
		@user = current_user
	end

	def create
		@muscle = Muscle.new (muscle_params)
		@muscle.user_id = current_user.id
		if @muscle.save
			flash[:notice] ="MUSCLE　最高"
		  redirect_to @muscle
		else
		  render "new"
		end
	end

	def update
		@muscle = Muscle.find(params[:id])
	  if@muscle.update(muscle_params)
	  	flash[:notice]="MUSCLE　最高"
		redirect_to muscle_path
	 else
	 	render'edit'
	 end
	end

 	def destroy
 		@muscle = Muscle.find(params[:id])
 		@muscle.destroy
 		redirect_to muscles_path
 	end

	private
	def  muscle_params
		params.require(:muscle).permit(:title,:body,:image,:muscle_genre,:video)
	end

	def correct_user
    @muscle = Muscle.find(params[:id])
    if @muscle.user != current_user
      redirect_to muscle_path
    end
  end
end

