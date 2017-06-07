Rails.application.routes.draw do
  resources :users
  get 'search/search'
  post 'search/search'


  get 'music_view/albumSort'
  get 'music_view/bandSort'
  get 'music_view/songSort'
  get 'music_view/genreSort'
  get 'music_view/releaseSort'

  resources :musics

  root :to => 'home#index'
  get 'home/index'
  get 'home/about'
  get 'home/privacy'
  get 'home/login'
  get 'home/logout'
  get 'home/user'
  get 'home/saveList'
  get 'home/removeMusic'
  post 'home/login'
  post 'home/index'
  post 'home/user'
  post 'home/saveList'
  post 'home/removeMusic'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
