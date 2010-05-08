class ApplicationController < ActionController::Base
  layout 'application'

  def log *args
    logger.info *args
  end
end
