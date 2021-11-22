Rails.application.routes.draw do

  resources :list_songs 
  resources :playlists
  resources :songs
  resources :artists
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #for home pages
  root 'home#home'
  get 'song_all_add', to: 'home#song'
  get 'artist_all_add', to: 'home#artist'
  get 'contact', to: 'home#contact'
  get 'playlist_all_add', to: 'home#playlist'
  post 'request_contact', to: 'home#request_contact'

  #for add song to playlist
  post 'addsongtolist', to: 'list_songs#create'
  


  

 
  
end
