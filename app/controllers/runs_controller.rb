class RunsController < ApplicationController
  respond_to :json

  def create
    @run = Run.new({
      :result => params[:result],
      :dep_name => params[:dep_name],
      :source_url => params[:source_url]
    })
    if @run.save
      respond_to {|format| format.json { render :json => @run } }
    else
      respond_to {|format| format.json { render :json => @run, :status => 406 } }
    end
  end
end
