class Task < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :deadline, presence: true
  validates :status, presence: true
  validates :priority, presence: true

  belongs_to :user
  has_one :notification, dependent: :destroy
  has_many :tag_tables, dependent: :destroy
  has_many :taglists, through: :tag_tables

  def check_tag(taglist)
    Taglist.find_or_create_by(tag_name: taglist) do |tag|
      tag.tag_name = taglist
    end
    @taglist = Taglist.find_by(tag_name: taglist)
    @tag_table = TagTable.new(taglist_id: @taglist.id, task_id: id)
    @tag_table.save
  end
end
