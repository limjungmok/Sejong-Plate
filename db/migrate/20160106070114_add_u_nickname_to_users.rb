class AddUNicknameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :u_nickname, :string
  end
end
