BabushkaMe::Application.routes.draw do |map|
  match '/deps/search.:format/:q', :to => 'deps#search', :via => :get
  match '/runs.:format', :to => 'runs#create', :via => :post

  match "/up", :to => "bootstrap#up", :via => :get, :format => :sh
  match "/up/:opts", :to => "bootstrap#up", :via => :get, :format => :sh
end
