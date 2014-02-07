class ChangeFromAndToGraphConnectors < ActiveRecord::Migration
  def up
  	rename_column :graph_connectors, :graph_bubbles_id, :from
  	#rename_column :graph_connectors, :to, :graph_bubbles_id
  end

  def down
  	rename_column :graph_connectors, :from, :graph_bubbles_id
  	#rename_column :graph_connectors, :graph_bubbles_id, :to
  end
end
