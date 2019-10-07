class AddUserIdToRouters < ActiveRecord::Migration[4.2]
  def change
    add_column :routers, :user_id, :integer
  end
end
