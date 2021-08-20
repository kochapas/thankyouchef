class RemoveStartsAtEndsAtFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :starts_at, :string
    remove_column :bookings, :ends_at, :string
  end
end
