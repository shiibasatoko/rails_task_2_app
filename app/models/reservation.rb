class Reservation < ApplicationRecord
  belongs_to:room
  belongs_to:user
  
  
  validates :start_on, presence: { message: 'は、必須です。'}
  validates :end_on, presence: { message: 'は、必須です。'}
  validates :people, numericality: { message: 'は、必須です。数字で入力してください。'}
  
end

