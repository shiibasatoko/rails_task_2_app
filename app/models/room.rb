class Room < ApplicationRecord
  attachment:image
  belongs_to :user
  has_many :reservations,dependent: :destroy
  
  def self.looks(searches,words)
    if searches == "perfect_match"
      @room = Room.where("address LIKE ? OR body LIKE ? OR fee LIKE ?","#{words}","#{words}","#{words}")
    else
      @room = Room.where("address LIKE ? OR body LIKE ? OR fee LIKE ?","%#{words}%","%#{words}%","%#{words}%")
    end
  end
  
  validates :title, presence: { message: 'は、必須です。'}
  validates :body, presence: { message: 'は、必須です。'}
  validates :fee, numericality: { message: 'は、必須です。数字で入力してください。'}
  validates :address, presence: { message: 'は、必須です。'}
  validates :image, presence: { message: 'は、必須です。'}
end
