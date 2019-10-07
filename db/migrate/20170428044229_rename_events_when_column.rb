class RenameEventsWhenColumn < ActiveRecord::Migration[4.2]
  def change
    rename_column :events, :when, :event_datetime
  end
end
