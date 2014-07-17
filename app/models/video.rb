class Video < ActiveRecord::Base

# attr_accessible :image,:video,:audio,:document
# has_attachment :content_type => :video,
#      :storage => :file_system,
#      :max_size => 300.megabytes

has_attached_file :video, :styles => {
    :mobile => {:geometry => "640x480", :format => 'mp4', :streaming => true}
  }, :processors => [:ffmpeg, :qtfaststart]
validates_attachment_content_type :video, :content_type => ['application/x-shockwave-flash', 'application/x-shockwave-flash', 'application/flv', 'video/x-flv','`/x-flash-video', 'video/mp4', 'video/mpeg']

has_attached_file :image, :styles => {:small => "100*100"}
validates_attachment_content_type :image, :content_type => [ 'image/png','image/jpeg','image/jpeg']


has_attached_file :audio
validates_attachment_content_type :audio, :content_type => [ 'audio/mp3','audio/mpeg']

has_attached_file :document
validates_attachment_content_type :document, :content_type => [ 'application/pdf','text/plain']

#turn off attachment_fu's auto file renaming
#when you change the value of the filename field
def rename_file
true
end

#acts as state machine plugin
# acts_as_state_machine :initial => :pending
# state :pending
# state :converting
# state :converted, :enter => :set_new_filename
# state :error

# event :convert do
# transitions :from => :pending, :to => :converting
# end

# event :converted do
# transitions :from => :converting, :to => :converted
# end

# event :failure do
# transitions :from => :converting, :to => :error
# end

# This method is called from the controller and takes care of the converting
def convert
self.convert!
success = system(convert_command)
if success && $?.exitstatus == 0
self.converted!
else
self.failure!
end
end

protected

# def convert_command

# #construct new file extension
# flv =  "." + id.to_s + ".flv"

# #build the command to execute ffmpeg
# command = <<-end_command   
# ffmpeg -i #{ RAILS_ROOT + '/public' + public_filename }
# -ar 22050 -ab 32 -s 480x360 -vcodec flv -r 25 -qscale 8 -f flv -y
# #{ RAILS_ROOT + '/public' + public_filename + flv }
# end_command    
# # logger.debug "Converting video...command: " + command    
# command  
# end

def convert_command
 
  #construct new file extension
  flv =  "." + id.to_s + ".flv"
 
  #build the command to execute ffmpeg
  command = <<-end_command
  ffmpeg -i #{ RAILS_ROOT + '/public' + public_filename }  -ar 22050 -ab 32 -s 480x360 -vcodec flv -r 25 -qscale 8 -f flv -y #{ RAILS_ROOT + '/public' + public_filename + flv }
 
  end_command

  logger.debug "Converting video...command: " + command
  command
end

# This updates the stored filename with the new flash video file
def set_new_filename 
update_attribute(:video_filename, "#{filename}.#{id}.flv")   
update_attribute(:video_content_type, "application/x-flash-video")
end

end
