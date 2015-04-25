class Reward < ActiveRecord::Base
  has_many :user_rewards
  has_many :users, through: :user_rewards
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  
  validates :name, presence: :true
  validates :description, presence: :true
  validates :cost, presence: :true
end
