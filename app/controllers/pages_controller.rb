class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    @user = current_user
    @photo = @user.photo
  end

  def update
    @user = current_user
    @user.photo = profile_params[:photo]
    @user.save
    redirect_to profile_path, notice: "Your profile picture was successfully updated!"
  end

  private

  def profile_params
    params.require("/users").permit(:photo)
  end
end
