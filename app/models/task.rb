class Task < ApplicationRecord
  belongs_to :user, optional: true

  with_options presence: true do
    validates :title
    validates :content
    validates :timelimit
  end

end
