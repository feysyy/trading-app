class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def after_sign_in_path_for(resource_or_scope)
    current_user.role ? admin_users_path : landing_page_path
    # line 6 to redirect admins to admin's index page path and user to main(landing_page_path) page path
  end
end
