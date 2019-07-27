class AddNameToRouter < ActiveRecord::Migration[5.2]
  def change
    add_column :routers, :name, :string
  end
end
