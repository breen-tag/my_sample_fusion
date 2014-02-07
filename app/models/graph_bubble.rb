class GraphBubble < ActiveRecord::Base
  has_many :bubble_connectors
  has_many :graph_connectors, :through => :bubble_connectors
  belongs_to :graph_connector
  attr_accessible :color, :name, :radius, :shape, :x, :y
end
