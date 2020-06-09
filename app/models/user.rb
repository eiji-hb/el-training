class User < ApplicationRecord
  validates :name, presence: true,length: {in: 3..20}
  validates :email, presence: true

  has_many :tasks
end
