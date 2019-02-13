class RemoveEditorFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :editor, :boolean
  end
end
