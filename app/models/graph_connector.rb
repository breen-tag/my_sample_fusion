class GraphConnector < ActiveRecord::Base
  has_many :bubble_connectors
  has_many :graph_bubbles, :through => :bubble_connectors
  belongs_to :graph_bubble
  # attr_accessible :color, :from, :strength, :to
end
