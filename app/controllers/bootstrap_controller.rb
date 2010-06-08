class BootstrapController < ApplicationController
  VALID_OPTS = %w[hard]
  def up
    opt_list = (params[:opts] || '').split(',')
    invalid_opts = opt_list.reject {|opt| VALID_OPTS.include? opt }
    if !invalid_opts.empty?
      render :status => 400, :text => "The options #{invalid_opts.inspect} aren't recognised. The valid ones are #{VALID_OPTS.inspect}."
    else
      opts = Hash[*opt_list.map {|i| [i.to_sym, true] }.flatten]
      render :action => 'up', :layout => false, :locals => {:opts => opts}
    end
  end
end
