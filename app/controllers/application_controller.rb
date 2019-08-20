class ApplicationController < ActionController::Base
    # protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    rescue_from Exception, with: :error500
    rescue_from ActiveRecord::RecordNotFound, ActionController::RoutingError, with: :error404
    
    def error404(e)
      render 'error404', status: 404, formats: [:html]
    end
    
    def error500(e)
      logger.error [e, *e.backtrace].join("\en")
      render 'error500', status: 500, formats: [:html]
    end
    
    def after_sign_in_path_for(resource)
      # admin_root_path
      root_path
    end

    def after_sign_out_path_for(resource)
      # admin_root_path
      root_path
    end
    
    def after_sign_up_path_for(resource)
      # admin_root_path
      root_path
    end

    def after_inactive_sign_up_path_for(resource)
      # admin_root_path
      root_path
    end

  protected

    def configure_permitted_parameters
      added_attrs = [ :name, :email, :password, :password_confirmation　]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
      devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    end
end
