Rails.application.routes.draw do
  resources :doctor_patients, only: %i[destroy]
  resources :patients, only: %i[index]
  resources :doctors, only: %i[show]
end
