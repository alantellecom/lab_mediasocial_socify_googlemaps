class AddUserIdToRouters < ActiveRecord::Migration[5.0]
  def change
    add_column :routers, :user_id, :integer
  end
end
