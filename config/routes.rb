Rails.application.routes.draw do
  get 'welcome/index', to: "welcome#index"
  root 'welcome#index'

  # mount verschillende api's (verschillende taken, of zelfde taken maar verschillende versies). Gebruik juiste filenaam en modulenaam in de api's!

  mount Rene::API => '/'
  #mount Rene2::API2 => '/'
  mount Rene3::API3 => '/'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
