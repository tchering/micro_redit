class AddUniqueIndexToUserName < ActiveRecord::Migration[7.1]
  def change
    add_index :users, :user_name, unique: true
    #Ex:- add_index("admin_users", "username")
  end
end
