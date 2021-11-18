Rails.application.routes.draw do


  resources :artists
  get 'home/home'
  get 'home/song'
  get 'home/playlist'
  get 'home/artist'
  get 'home/contact'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#home'
  get 'playlist', to: 'home#playlist'
  get 'song_all_add', to: 'home#song'
  get 'artist_all_add', to: 'home#artist'
  get 'contact', to: 'home#contact'


  


  post 'request_contact', to: 'home#request_contact'

 
  
end
