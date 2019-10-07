class AddNameToRouter < ActiveRecord::Migration[4.2]
  def change
    add_column :routers, :name, :string
  end
end
