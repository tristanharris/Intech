class AddOpenFlagToLecture < ActiveRecord::Migration
  def self.up
    add_column :lectures, :open, :boolean
  end

  def self.down
    remove_column :lectures, :open
  end
end
