class User < ApplicationRecord
  validates :name, presence: true,length: {in: 3..20}
  validates :email, presence: true,uniqueness: true
  has_secure_password

  has_many :tasks, dependent: :destroy
  has_many :notifications, dependent: :destroy
  enum admin: { general: false, admin: true }
end
