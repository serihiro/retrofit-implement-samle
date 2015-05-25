class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :todo, null: false
      t.boolean :done, default: false, null:false
      t.timestamps null: false
    end
  end
end
