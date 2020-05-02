class Muscle < ApplicationRecord
	belongs_to :user
	attachment :image
	has_many :favorites, dependent: :destroy
	has_many :muscle_comments,dependent: :destroy
		# Enum
	GENRES = ['腹筋', '大胸筋', '上腕二頭筋', '上腕二頭筋', 'プロテイン']

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
