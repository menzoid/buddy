class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  private

  def profile_params
    params.require(:profile).permit(:username, :first_name, :last_name, :bio, :phone_number)
  end
end
