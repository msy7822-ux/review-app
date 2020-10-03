class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?



    protected
    def configure_permitted_parameters
        # :sign_up、つまり新規登録の際にusernameの入力を許可する
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end
end
