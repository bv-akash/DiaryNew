Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users
 
	root 'welcome#index'

resources :users do
    resources :articles
  end

	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
