Rails.application.routes.draw do
	devise_for :admin_users, ActiveAdmin::Devise.config
	ActiveAdmin.routes(self)
	namespace :api do
		namespace :v1 do
			resources :users 
				post '/auth/login', to: 'authentication#login' 
				get '/question/:id', to: 'question#show'
		end
	end 
end