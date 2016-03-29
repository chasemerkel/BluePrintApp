class ProfilesController < ApplicationController
  before_action :redirect_non_user

  def show
  end

  def change_password
  end

  def update_password
    if current_user.authenticate(password_params[:old_password])
      respond_to do |format|
        if current_user.update(password: password_params[:new_password], confirm_password: password_params[:confirm_password])
          format.html { redirect_to @user, notice: 'Your password was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :change_password }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def password_params
      params.require(:profile).permit(:new_password, :confirm_password, :old_password)
    end
end
