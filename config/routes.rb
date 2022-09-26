Rails.application.routes.draw do
  resources :doctor_patients
  resources :patients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
