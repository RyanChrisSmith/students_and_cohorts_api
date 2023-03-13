Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :students, only: %i[index show]
      resources :cohorts, only: %i[show]
    end
  end
end
