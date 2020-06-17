class RenameNotififcationToNotification < ActiveRecord::Migration[6.0]
  def change
    rename_table :notififcations, :notifications
  end
end
