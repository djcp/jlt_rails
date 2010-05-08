class CreateFixes < ActiveRecord::Migration
  def self.up
    create_table :fixes do |t|
      t.datetime :fix_time
      t.string :latitude
      t.string :longitude
      t.string :horiz_accuracy
      t.string :vert_accuracy
      t.string :altitude
      t.string :velocity
      t.string :heading

      t.timestamps
    end
  end

  def self.down
    drop_table :fixes
  end
end
