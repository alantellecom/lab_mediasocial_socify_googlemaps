class AddNameToRouter < ActiveRecord::Migration[5.0]
  def change
    add_column :routers, :name, :string
  end
end
