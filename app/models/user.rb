class User < ApplicationRecord
  has_many :tasks

  with_options presence: true do
    validates :name
    validates :email
  end

  with_options uniqueness: true do
    validates :email
  end

end
