class Notification < ApplicationRecord
  default_scope->{order(created_at: :desc)}

  belongs_to :task
  belongs_to :user

  enum action: { warning: 1, expired: 2}
end
