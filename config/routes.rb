Rails.application.routes.draw do

	devise_for :users
	root 'home#top'
	get'home/about' =>"home#about"
	get'users/follower'=>"users#follower"
	get'users/follows'=>"users#follows"

	resources :users ,only: [:index,:show,:edit,:update,:destroy]

	resources :muscles do
		resources :muscle_comments,only:[:create ,:destroy]
		resources :favorites,only:[:create,:destroy]

	end
	resources :relationships, only:[:create,:destroy]
end
