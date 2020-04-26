class Favorite < ApplicationRecord
	belongs :user
	belongs_to :muscle
end
