class ProfilesController < ApplicationController
  before_action :redirect_non_user

  def show
  end

  def change_password
  end

  def update_password
    respond_to do |format|
      if current_user.update(profile_params)
        format.html { redirect_to @user, notice: 'Your profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def update_password_params
      params.require(:profile).permit(:new_password, :confirm_password, :old_password)
    end
end
