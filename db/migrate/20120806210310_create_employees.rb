class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table :employees do |t|
      t.string :idString
      t.string :name
      t.boolean :admin

      t.timestamps
    end
  end

  def self.down
    drop_table :employees
  end
end
