Rails.application.routes.draw do
  resources :orders do
    resources :order_positions, shallow: true
  end
  resources :executors
  resources :service_categories do
    resources :service_units, shallow: true
  end

  root to: "pages#index"
end
