class CreateBubbleConnectors < ActiveRecord::Migration
  def change
    create_table :bubble_connectors do |t|
      t.integer :graph_bubble_id
      t.integer :graph_connector_id

      t.timestamps
    end
  end
end
