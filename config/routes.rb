Rails.application.routes.draw do
  get 'welcome/index', to: "welcome#index"
  root 'welcome#index'

  #mount Rene::API => '/'
  mount Rene2::API2 => '/'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
