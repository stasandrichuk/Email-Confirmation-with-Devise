Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users, :controllers => { :invitations => 'users/invitations' }
  resources :users do
  end
end
