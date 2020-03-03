class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in? #Allows the other Controllers to be able to use these methods

    def current_user 
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def ensure_logged_in
        redirect_to bands_url if logged_in?
    end

    def ensure_logged_out

    end

    def login!(user)
        session[:session_token] = user.reset_session_token!
    end

    def logged_in?
        !!current_user
    end

    def logout! 
        current_user.reset_session_token! 
        session[:session_token] = nil
        @current_user = nil
    end
end
