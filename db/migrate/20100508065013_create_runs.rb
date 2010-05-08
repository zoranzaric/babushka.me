class CreateRuns < ActiveRecord::Migration
  def self.up
    create_table :runs do |t|
      t.string :dep_name, :limit => 128, :null => false
      t.string :source_url, :limit => 128, :null => false
      t.string :result, :limit => 8, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :runs
  end
end
