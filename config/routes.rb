Rails.application.routes.draw do
  resources :films
  resources :people

  root to: 'pages#about'
end
