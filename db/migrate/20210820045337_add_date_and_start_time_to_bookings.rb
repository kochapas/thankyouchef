class AddDateAndStartTimeToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :date_and_start_time, :string
  end
end
