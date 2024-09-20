class RenameNameToUserNameInUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :name, :user_name
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
