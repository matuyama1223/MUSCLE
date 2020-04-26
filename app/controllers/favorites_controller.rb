class FavoritesController < ApplicationController
	def create
		muscle = Muscle.find(params[:muscle_id])
		favorite = current_user.favorites.new(muscle_id: muscle.id)
		favorite.seve
		rediret_to muscle_path(muscle)
	end
	def destroy
		muscle = Muscle.find(params[:muscle_id])
		favorite = current_user.favorites.find_by(muscle_id: muscle.id)
		favorite.destroy
		rediret_to muscle_path(muscle)

	end
end
