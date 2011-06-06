class CreateLectures < ActiveRecord::Migration
  def self.up
    create_table :lectures do |t|
      t.string :title
      t.datetime :time
      t.text :details
      t.integer :max_seats
      t.boolean :open

      t.timestamps
    end
  end

  def self.down
    drop_table :lectures
  end
end
