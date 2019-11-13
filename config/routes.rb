Rails.application.routes.draw do
  resources :cards
  resources :products
  resources :signup do
    collection do
      get 'step1'
      get 'step2' 
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "cards#index"
end
