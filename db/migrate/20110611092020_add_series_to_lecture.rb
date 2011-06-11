class AddSeriesToLecture < ActiveRecord::Migration
  def self.up
    add_column :lectures, :series_id, :integer
  end

  def self.down
    remove_column :lectures, :series_id
  end
end
