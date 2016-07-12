class AddRefreshAndExpiresToUser < ActiveRecord::Migration
  def change
    add_column :users, :oauth_refresh_token, :string
    add_column :users, :token_expires_at, :integer
  end
end
