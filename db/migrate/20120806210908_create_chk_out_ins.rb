class CreateChkOutIns < ActiveRecord::Migration
  def self.up
    create_table :chk_out_ins do |t|
      t.integer :employee_id
      t.integer :asset_id
      t.datetime :checkedOutTime
      t.datetime :checkedInTime

      t.timestamps
    end
  end

  def self.down
    drop_table :chk_out_ins
  end
end
