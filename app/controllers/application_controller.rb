class ApplicationController < ActionController::Base
  #devise_controllerってどういう意味？
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :current_guest
  protect_from_forgery with: :exception
  before_action :basic, if: :devise_controller?



  def current_guest
    if session[:guest_id]
      @guest = Guest.find_by(id: session[:guest_id])
    else
      @guest = Guest.create
      session[:guest_id] = @guest.id
    end
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  private

    def basic
      name = 'hiroto'
      passwd = 'dba5626f0062c8ccd0e1ff55494cf92c9aa1a491'
      authenticate_or_request_with_http_basic do |n, p|
        n == name && Digest::SHA1.hexdigest(p) == passwd
      end
    end

end
