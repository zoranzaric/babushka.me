BabushkaMe::Application.routes.draw do |map|
  match '/deps/search.:format/:q', :to => 'deps#search', :conditions => {:method => :get}
  match '/runs.:format', :to => 'runs#create', :conditions => {:method => :post}

  match "/up", :to => "bootstrap#up", :conditions => {:method => :get}, :format => :sh
  match "/up/:opts", :to => "bootstrap#up", :conditions => {:method => :get}, :format => :sh, :opts => /[a-z0-9\-_,]+/i
end
