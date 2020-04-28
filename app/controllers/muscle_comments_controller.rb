class MuscleCommentsController < ApplicationController
	def create
		muscle = Muscle.find(params[:muscle_id])
		comment = current_user.muscle_comments.build(muscle_comment_params)
		comment.muscle_id = muscle.id
		comment.save
		redirect_to muscle_path(muscle)

	end
	def destroy
		muscle_comment = MuscleComment.find(params[:id])
		muscle_comment.destroy
		redirect_to request.referer
		# request.referer	消えて前に戻る
	end
	def muscle_comment_params
		params.require(:muscle_comment).permit(:comment)
	end
end
