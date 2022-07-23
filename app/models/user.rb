class User < ApplicationRecord
  has_one :token
  self.table_name = 'users'

  validates :nickname, presence: true 
  validates :email, presence: true
  validates :profileImage, presence: true
end
