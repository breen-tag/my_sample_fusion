class CreateGraphBubbles < ActiveRecord::Migration
  def change
    create_table :graph_bubbles do |t|
      t.float :x
      t.float :y
      t.string :name
      t.integer :radius
      t.string :shape
      t.string :color

      t.timestamps
    end
  end
end
