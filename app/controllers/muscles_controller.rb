class MusclesController < ApplicationController
	def index
		@muscles = Muscle.all
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
	end

	def create
		@muscle = Muscle.new (muscle_params)
		@muscle.user_id = current_user.id
		@muscle.save
		redirect_to @muscle
	end


	def update
		@muscle = Muscle.find(params[:id])
		@muscle.update(muscle_params)
		redirect_to muscle_path
	end
 	def destroy
 		@muscle = Muscle.find(params[:id])
 		@muscle.destroy
 		redirect_to muscles_path
 	end

	private
	def  muscle_params
		params.require(:muscle).permit(:title,:body,:image)
	end
end

