class Certification < ApplicationRecord
  self.table_name = 'certifications'

  validates :id, presence: true
  validates :email, presence: true
  validates :code, presence: true 
  validates :isSignup, presence: true
  validates :deleteTime, presence: true 
end
