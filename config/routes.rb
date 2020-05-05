Rails.application.routes.draw do

	devise_for :users
	root 'home#top'
	get'home/about' =>"home#about"

	resources :users ,only: [:index,:show,:edit,:update,:destroy]

	resources :muscles do
		resources :muscle_comments,only:[:create ,:destroy]
		resources :favorites,only:[:create,:destroy]

	end
end
