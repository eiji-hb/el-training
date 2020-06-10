class TagTable < ApplicationRecord
  belongs_to :taglist
  belongs_to :task
end
