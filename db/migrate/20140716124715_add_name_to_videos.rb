class AddNameToVideos < ActiveRecord::Migration
  def change
  	add_column :videos, :video_name, :string
  	rename_column :videos, :filename, :video_file_name
  	rename_column :videos, :content_type, :video_content_type
  	rename_column :videos, :size, :video_file_size
  	rename_column :videos, :title, :video_title
  end
end
