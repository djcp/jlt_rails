class CreateFixes < ActiveRecord::Migration
  def self.up
    create_table :fixes do |t|
      t.datetime :fix_time
      t.decimal :latitude, :precision => 16, :scale => 13
      t.decimal :longitude, :precision => 16, :scale => 13
      t.decimal :horiz_accuracy, :precision => 16, :scale => 13
      t.decimal :vert_accuracy, :precision => 16, :scale => 13
      t.integer :altitude
      t.decimal :velocity, :precision => 8, :scale => 3
      t.integer :heading
      t.timestamps
    end
    [:fix_time, :latitude, :longitude].each do|col|
      add_index :fixes, col
    end
  end

  def self.down
    drop_table :fixes
  end
end
