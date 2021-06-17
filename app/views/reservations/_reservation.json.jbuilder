json.extract! reservation, :id, :user_id, :room_id, :start_on, :end_on, :people, :sum_fee, :days, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
