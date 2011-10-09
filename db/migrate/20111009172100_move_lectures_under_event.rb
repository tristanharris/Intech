class MoveLecturesUnderEvent < ActiveRecord::Migration
  def self.up
    remove_column :lectures, :series_id
    add_column :lectures, :event_id, :integer
  end

  def self.down
    add_column :lectures, :series_id, :integer
    remove_column :lectures, :event_id
  end
end
