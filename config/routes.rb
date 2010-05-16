BabushkaMe::Application.routes.draw do |map|
  match '/deps/search.:format/:q', :to => 'deps#search', :conditions => {:method => :get}
  match '/runs.:format', :to => 'runs#create', :conditions => {:method => :post}
  %w[up hard privately].each {|style|
    match "/#{style}", :to => "bootstrap##{style}", :conditions => {:method => :get}, :format => :sh
  }
end
