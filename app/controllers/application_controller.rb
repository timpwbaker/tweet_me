class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    User.find_or_create_by(name: "Anonymous")
  end
  helper_method :current_user
end
