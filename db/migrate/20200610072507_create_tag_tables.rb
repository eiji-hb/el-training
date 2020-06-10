class CreateTagTables < ActiveRecord::Migration[6.0]
  def change
    create_table :tag_tables do |t|
      t.references :taglist, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
