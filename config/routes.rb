Rails.application.routes.draw do
  resources :redirects
  resources :links
  root "redirects#new"
end
