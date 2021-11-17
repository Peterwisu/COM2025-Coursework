Rails.application.routes.draw do


  resources :songs
  get 'home/home'
  get 'home/song'
  get 'home/playlist'
  get 'home/artist'
  get 'home/contact'
  get 'home/home'
  get 'home/playlist'
  get 'home/table'
  get 'home/contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#home'
  get 'playlist', to: 'home#playlist'
  get 'addsong', to: 'home#song'
  get 'contact', to: 'home#contact'
  get 'artist', to: 'home#artist'


  post 'request_contact', to: 'home#request_contact'

 
  
end
