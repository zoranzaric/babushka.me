class BabushkaController < ApplicationController
  def tarball
    Delayed::Job.enqueue BabushkaRun.new('babushka tarball')
    render :nothing => true
  end
end
