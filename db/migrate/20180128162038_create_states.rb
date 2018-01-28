class CreateStates < ActiveRecord::Migration[5.1]
  def change
    create_table :states do |t|
      t.string :name
      t.string :color
    end

   add_reference :ideas, :state, index: true, foreign_key: true 
  end
end
