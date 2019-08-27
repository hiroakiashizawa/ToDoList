class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :user, optional: true
end
