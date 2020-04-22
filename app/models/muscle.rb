class Muscle < ApplicationRecord
	belongs_to :user
	attachment :image
end
