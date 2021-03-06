class Muscle < ApplicationRecord
	belongs_to :user

	attachment :image
	attachment :video

	has_many :favorites, dependent: :destroy
	has_many :muscle_comments,dependent: :destroy

	validates :body,presence: true,length: {minimum:2,maximum:200}
	validates :title,presence:true,length: {minimum:3}
		# Enum
	GENRES = ['腹筋(ふっきん)　', '大胸筋(だいきょうきん)', '上腕二頭筋(じょうわんにとうきん)', '大腿四頭筋(だいたいしとうきん)', 'プロテイン']

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
