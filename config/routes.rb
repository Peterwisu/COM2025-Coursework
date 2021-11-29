Rails.application.routes.draw do

  devise_for :users
  resources :list_songs
  resources :playlists
  resources :songs
  resources :artists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #set root of a website
  root 'home#home'
  #set a route for contact and about 
  get 'contact', to: 'home#contact'
  get 'about', to: 'home#about'
  #set a path for mailer 
  post 'request_contact', to: 'home#request_contact'
 
  
  

  


  

 
  
end
