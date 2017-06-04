Rails.application.routes.draw do
  root :to => 'home#index'

  get 'music_view/albumSort'
  get 'music_view/bandSort'
  get 'music_view/songSort'
  get 'music_view/genreSort'
  get 'music_view/releaseSort'

  resources :musics

  get 'home/index'
  get 'home/about'
  get 'home/privacy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
