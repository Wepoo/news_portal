class ChangeUsersProvider < ActiveRecord::Migration
  def change
  	rename_column :users, :facebook, :provider
  end
end
