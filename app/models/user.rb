class User < ActiveRecord::Base
  has_secure_password

  def is_admin?
    self.role == 'admin'
  end

  def is_player?
    self.role == 'player'
  end
end
