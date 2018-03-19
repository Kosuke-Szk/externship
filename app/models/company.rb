class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects, through: :applies
  has_many :applies
  mount_uploader :image, ImageUploader

  def company_applied_for(project)
    !!applies.find_by(project_id: project.id)
  end
end
