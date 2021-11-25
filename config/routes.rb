Rails.application.routes.draw do

  devise_for :users
  resources :list_songs
  resources :list_songs 
  resources :playlists
  resources :songs
  resources :artists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #for home pages
  root 'home#home'
  get 'song', to: 'home#song'
  get 'artist', to: 'home#artist'
  get 'contact', to: 'home#contact'
  get 'playlist', to: 'home#playlist'

  #for mailer 
  post 'request_contact', to: 'home#request_contact'
  #route redirected after the submission from contact
  get 'mailsend', to: "home#mailsend"
  #for add song to playlist
  

  


  

 
  
end
