class User < ActiveRecord::Base

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.email      = auth_info.info.email
      new_user.first_name = auth_info.info.first_name
      new_user.last_name = auth_info.info.last_name
      new_user.avatar = auth_info.info.image
      new_user.uid = auth_info.uid
      new_user.oauth_token = auth_info.credentials.token
      new_user.oauth_refresh_token = auth_info.credentials.refresh_token
      new_user.token_expires_at = auth_info.credentials.expires_at
    end
  end
end
