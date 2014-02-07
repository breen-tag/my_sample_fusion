class CreateGraphConnectors < ActiveRecord::Migration
  def change
    create_table :graph_connectors do |t|
      t.integer :from
      t.integer :to
      t.string :color
      t.integer :strength

      t.timestamps
    end
  end
end
