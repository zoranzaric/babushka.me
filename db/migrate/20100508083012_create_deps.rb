class CreateDeps < ActiveRecord::Migration
  def self.up
    create_table :deps do |t|
      t.references :source, :null => false
      t.string :name, :limit => 128, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :deps
  end
end
