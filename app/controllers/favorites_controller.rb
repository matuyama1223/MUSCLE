class FavoritesController < ApplicationController
	def create
		muscle = Muscle.find(params[:muscle_id])
		favorite = current_user.favorites.new(muscle_id: muscle.id)
		favorite.save
		redirect_to muscles_path
	end
	def destroy
		muscle = Muscle.find(params[:muscle_id])
		favorite =Favorite.find(params[:id])
		favorite.destroy
		redirect_to muscles_path

	end
end
