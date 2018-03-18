class Apply < ApplicationRecord
  enum status: { apply: 0, contact: 1, success: 2, decline: 3, error: 4 }
  belongs_to :project
  belongs_to :company
end
