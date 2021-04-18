Rails.application.routes.draw do
  root "products#index"
  resources :products do
    get :supply, on: :member
    get :writeoff, on: :member
    patch :add_amount, on: :member
    patch :cut_amount, on: :member
  end
end
