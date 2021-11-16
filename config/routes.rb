Rails.application.routes.draw do


  

  get 'home/home'
  get 'home/playlist'
  get 'home/table'
  get 'home/contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#home'
  get 'playlist', to: 'home#playlist'
  get 'table', to: 'home#table'
  get 'contact', to: 'home#contact'
  
end
