class BubbleConnector < ActiveRecord::Base
  # attr_accessible :graph_bubble_id, :graph_connector_id
  belongs_to :graph_connector
  belongs_to :graph_bubble
end
