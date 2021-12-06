class SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(resource)
    #unless resource.profile.present?
    #  new_profile_path
    #end
     #edit_user_registration_path
end
