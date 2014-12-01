class DropBookingsTable < ActiveRecord::Migration
  def up
	drop_table :bookings
  end
  def down
	create_table :bookings do |t|
      t.datetime :check_in_time
      t.datetime :check_out_time
	  
	  
	  t.timestamps
  end
  add_index :bookings, [:check_in_time, :check_out_time], name: 'bookings_index'
  end
end
