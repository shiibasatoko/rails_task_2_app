class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :room_id
      t.date :start_on
      t.date :end_on
      t.integer :people
      t.decimal :sum_fee,:default => 0
      t.integer :days,:default => 0

      t.timestamps
    end
  end
end
