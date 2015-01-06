class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  layout :is_xhr?

  def is_xhr?
    false if request.xhr?
  end  
end
