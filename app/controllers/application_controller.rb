class ApplicationController < ActionController::Base
  protect_from_forgery

  def error_log(e)
    logger.error("msg=#{e.message}, backtrace=#{e.backtrace}")
  end
end
