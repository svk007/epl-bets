Rails.application.routes.draw do
  get 'welcome/index'

	get 'auth/:provider/callback', to: 'sessions#create'
	get 'auth/failure', to: redirect('/')
	get 'signout', to: 'sessions#destroy', as: 'signout'
	resources :matches
	root to: 'welcome#index'
	post 'bets', to: 'bets#userbet', as: 'user_bets'
	get 'prizes', to: 'bets#usersprizes', as: 'user_prizes'
	get 'leaderboard', to: 'users#leaderboard', as: 'leaderboard'
	get 'mybets', to: 'users#mybets', as: 'show_user_bets'
end
