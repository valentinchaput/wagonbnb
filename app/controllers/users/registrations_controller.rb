module Users
  class RegistrationsController < Devise::RegistrationsController

    private

    def sign_up_params
      params.require(:user).permit(:name, :email, :password, :phone_number, :password_confirmation)
    end

    def account_update_params
      params.require(:user).permit(:name, :email, :password, :phone_number, :password_confirmation, :current_password)
    end
  end
end