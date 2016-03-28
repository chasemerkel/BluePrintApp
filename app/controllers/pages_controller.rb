class PagesController < ApplicationController
  
  def home
    non_user_home unless current_user
    player_home if current_user.is_player?
    admin_home if current_user.is_admin?
  end
  
private

  def admin_home
    format.html{render :admin_home}
  end
  
  def player_home
    format.html{render :player_home}
  end
  
  def non_user_home
    redirect_to login_url
  end
end
