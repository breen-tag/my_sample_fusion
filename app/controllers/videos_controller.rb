class VideosController < ApplicationController
  def index
   @videos = Video.find :all
 end

 def new
   @video = Video.new
 end

 def create
 	if video_params.present?
   	  @video = Video.new(video_params)
   	  if @video.save
   	    # @video.convert
   	    flash[:notice] = 'Video has been uploaded'
   	    redirect_to :action => 'index'
   	  else
   	    render :action => 'new'
   	  end
   	else
   		flash[:notice] = 'Please attach atleast any file'
   		redirect_to :action => 'index'
   	end

     #check if file is within picture_path
  #   if params[:picture][:picture_path]["file"]
  #       picture_path_params = params[:picture][:picture_path]
  #       #create a new tempfile named fileupload
  #       tempfile = Tempfile.new("fileupload")
  #       tempfile.binmode
  #       #get the file and decode it with base64 then write it to the tempfile
  #       tempfile.write(Base64.decode64(picture_path_params["file"]))

  #       #create a new uploaded file
  #       uploaded_file = ActionDispatch::Http::UploadedFile.new(:tempfile => tempfile, :filename => picture_path_params["filename"], :original_filename => picture_path_params["original_filename"])

  #       #replace picture_path with the new uploaded file
  #       params[:picture][:picture_path] =  uploaded_file
  #  end

  #  	@picture = Picture.new(params[:picture])

  #   respond_to do |format|
		# if @picture.save
		# 	format.html { redirect_to @picture, notice: 'Picture was successfully created.' }
		# 	format.json { render json: @picture, status: :created, location: @picture }
		# else
		#    format.html { render action: "new" }
		#    format.json { render json: @picture.errors, status: :unprocessable_entity }
		# end
  #   end



 end

 def show
   @video = Video.find(params[:id])
 end

 def delete
   @video = Video.find(params[:id])
   @video.destroy
   redirect_to :action => 'index'
 end


private

  def video_params  	
  	# From Web
  		# params.require(:video).permit(:video,:image,:audio,:document) if (params[:video] || params[:image] || params[:audio] || params[:document])
  	
  	# From mobile
  		params.permit(:video,:image,:audio,:document) if (params[:video] || params[:image] || params[:audio] || params[:document])
  end

end
