class Taglist < ApplicationRecord
  has_many :tag_tables, dependent: :destroy
  has_many :tasks, through: :tag_tables

end
