class BootstrapController < ApplicationController
  def up
    opts = (params[:opts] || '').split(',').inject({}) {|hsh,opt|
      hsh[opt.to_sym] = true
      hsh
    }
    render :action => 'up', :layout => false, :locals => {:opts => opts}
  end
end
