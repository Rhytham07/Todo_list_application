Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create, :update, :destroy]
  resources :tasks, except: [:edit] # Include 'except: [:edit]' to exclude the edit route if not needed
  resources :sub_tasks, only: [:index, :show, :create, :update, :destroy]
end
