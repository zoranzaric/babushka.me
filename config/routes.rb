BabushkaMe::Application.routes.draw do |map|
  match '/deps/search.:format/:q', :to => 'deps#search', :via => :get
  match '/runs.:format', :to => 'runs#create', :via => :post

  match '/a_new_tarball', :to => 'babushka#tarball', :via => :post

  match "/up", :to => "bootstrap#up", :via => :get, :format => :sh
  match "/up/:opts", :to => "bootstrap#up", :via => :get, :format => :sh

  match "/refs/heads/:refname", :to => 'redirect#refname', :refname => /[0-9a-z_\-\.]+/i
  match "/issues/:id", :to => 'redirect#issue', :id => /\d+/
  match "/:id", :to => 'redirect#commit', :id => /[0-9a-f]{7,40}/i
end
