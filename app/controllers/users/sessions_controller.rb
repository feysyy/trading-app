module Users
  class SessionsController < Devise::SessionsController
    def create
      self.resource = warden.authenticate(auth_options)
      if resource
        set_flash_message!(:notice, :signed_in)
        sign_in(resource_name, resource)
        redirect_to after_sign_in_path_for(resource)
      else
        flash[:alert] = "Invalid Email or password."
        redirect_to root_path
      end
    end
  end
end
