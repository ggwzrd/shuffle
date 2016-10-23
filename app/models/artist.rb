class Artist < ApplicationRecord
  mount_uploader :photo, ImageUploader
  has_many :songs

  validates :first_name, presence: true, length: {maximum: 50}
  validates :last_name, presence: true, length: {maximum: 50}
  validates :bio, presence: true
  # validates :photo, presence: true
end
