class Project < ApplicationRecord
  validates :title, presence: true
  validates :target_amount_of_money, presence: true
  validates :description, presence: true
  belongs_to :user
  mount_uploader :image, ImageUploader
  has_many :companies, through: :applies
  has_many :applies

  def self.search(search)
    if search == ''
      Project.all
    elsif search
      patterns = search.split(/[ ,　]/)
      sql_body = ''
      patterns.each do | pattern |
        sql_body += ' and ' unless sql_body.blank?
        sql_body += " title like '%#{pattern}%' OR opinion like '%#{pattern}%' OR description like '%#{pattern}%' "
      end
      sql = "select * from projects where #{sql_body} order by id desc"
      project_ids = Project.find_by_sql(sql)
      ids = []
      project_ids.each do |qi|
        ids.push(qi.id)
      end
      where(:id => ids)
    else
      Project.all
    end
  end
end
