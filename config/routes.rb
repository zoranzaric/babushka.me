BabushkaMe::Application.routes.draw do |map|
  resources :sources

  match '/deps/search.:format/:q', :to => 'deps#search'
  resources :deps

  resources :runs
end
