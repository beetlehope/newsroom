class AddAuthorToIdeas < ActiveRecord::Migration[5.1]
  def change
    add_reference :ideas, :author, index: true
    add_foreign_key :ideas, :users, column: :author_id
  end
end
