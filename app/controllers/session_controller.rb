class UsersController < ApplicationController
  
  def new
  end

  def create
    
  end

  def destroy
    session[:user_id] = nil
  end
end
