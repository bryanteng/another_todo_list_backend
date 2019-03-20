class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :title
      t.jsonb :items, default: [], array: true
      t.string :color
      t.string :category
      t.timestamps
    end
  end
end
