class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_secure_password
  
  with_options presence: true do
    validates :name
    validates :email
  end

  with_options uniqueness: true do
    validates :email
  end

end
