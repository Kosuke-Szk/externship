class Project < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  has_many :companies, through: :applies
  has_many :applies
end
