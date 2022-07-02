class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    if  warden.user.employee == true
      rails_admin_path
    else
      main_app.root_path
    end

  end

end
