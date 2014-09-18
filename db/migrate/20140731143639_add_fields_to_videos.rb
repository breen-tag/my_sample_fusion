class AddFieldsToVideos < ActiveRecord::Migration
  def change
  	add_column :videos, :post_story, :string
  	add_column :videos, :author_name, :string
  	add_column :videos, :author_emailaddress, :string
  	add_column :videos, :author_mobilenumber, :string
  	add_column :videos, :token, :string
  end
end
