class RedirectController < ApplicationController
  def commit
    redirect_to "http://github.com/benhoskings/babushka/commit/#{params[:id]}"
  end
end
