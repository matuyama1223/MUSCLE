Rails.application.routes.draw do

  get 'muscles/index'
  get 'muscles/edit'
  get 'muscles/show'
	devise_for :users
	root 'home#top'
	get'home/about' =>"home#about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	    resources :users ,only: [:index,:show,:edit,:update]
  	    resources :muscles

end
