class RedirectController < ApplicationController
  def refname
    redirect_to "http://github.com/benhoskings/babushka/tree/#{params[:refname]}"
  end
  def issue
    redirect_to "http://github.com/benhoskings/babushka/issues#issue/#{params[:id]}"
  end
  def commit
    redirect_to "http://github.com/benhoskings/babushka/commit/#{params[:id]}"
  end
end
