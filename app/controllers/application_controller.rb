class ApplicationController < ActionController::Base
	before_action :set_locale
	before_action :configure_permitted_parameters, if: :devise_controller?
	
	include Pundit
	include Internationalization
	
	def after_sign_in_path_for(resource)
	  users_path(current_user) # your path
	end

	private
		def default_url_options
			{locale: I18n.locale}
		end
		def set_locale
			I18n.locale = extract_locale || I18n.default_locale
		end
		def extract_locale
			parsed_locale = params[:locale]
			I18n.available_locales.map(&:to_s).include?(parsed_locale) ?
				parsed_locale.to_sym :
				nil
		end	


		protected

		def configure_permitted_parameters
			devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :country, :city])
			devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :country, :city])
		end
end
