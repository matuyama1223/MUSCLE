Rails.application.routes.draw do

	devise_for :users
	root 'home#top'
	get'home/about' =>"home#about"

	resources :users ,only: [:index,:show,:edit,:update]

	resources :muscles do
		resource :muscle_comments,only:[:create]
		resources :favorites,only:[:create,:destroy]

	end
end
