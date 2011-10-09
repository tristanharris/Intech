class CreateEventTable < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :title
      t.text :details
      t.datetime :time
      t.boolean :open
      t.integer :series_id

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
