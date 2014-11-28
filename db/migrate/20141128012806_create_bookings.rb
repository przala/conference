class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.datetime :check_in_time
      t.datetime :check_out_time
      t.string :userselect
      t.string :roomselect

      t.timestamps
    end
  end
end
