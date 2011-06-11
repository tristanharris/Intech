class CreateSeriesTable < ActiveRecord::Migration
  def self.up
    create_table :series do |t|
      t.string :title
      t.text :details
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :series
  end
end
