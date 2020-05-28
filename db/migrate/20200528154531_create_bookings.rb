class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.timestamp :start_at
      t.timestamp :end_at

      t.timestamps
    end
  end
end
