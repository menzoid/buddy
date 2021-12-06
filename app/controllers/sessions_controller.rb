class SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(resource)
    if resource.profile.present?
      dashboard_path
    else
      edit_profile_path
    end
  end
end
