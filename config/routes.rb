Rails.application.routes.draw do
  get 'welcome/index'

	get 'auth/:provider/callback', to: 'sessions#create'
	get 'auth/failure', to: redirect('/')
	get 'signout', to: 'sessions#destroy', as: 'signout'
	resources :matches
	root to: 'welcome#index'
	post 'bets', to: 'matches#userbet', as: 'user_bets'
	get 'prizes', to: 'matches#usersprizes', as: 'user_prizes'
	get 'leaderboard', to: 'users#leaderboard', as: 'leaderboard'
	get 'instructions', to: 'welcome#instructions', as: 'instructions'
end
