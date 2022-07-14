Rails.application.routes.draw do
  resources :service_categories do
    resources :service_units, shallow: true
  end

  root to: "pages#index"
end
