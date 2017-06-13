class Admin::FilesController < Admin::BaseController
#   图片上传
  def image_upload
    render :json => "不是图片", :status => 500 and return unless check_image_filename(params[:file])
    file_name,file_path=upload_file(params[:file],"images")
    respond_to do |format|
      format.json {render :json=>{:link=>file_path}}
      format.html {render :text => file_path}
    end
  end
  # 上传文件
  def file_upload
    file_name, file_path = upload_file(params[:file],"files")
    respond_to do |format|
      format.json { render :json => { :link => file_path}}
      format.html { render :text => file_path }
    end
  end


  private
  def upload_file(file,file_type)
    if !file.original_filename.empty?
      filename = file.original_filename
      folder = upload_folder(file_type)
      file_path = File.join(folder,filename)

      File.open(file_path, 'wb') do |f|
        f.write(file.read)
      end
      file_url = "/site_upload/#{file_type}/#{filename}"
      return filename, file_url
    end
  end
  def upload_folder(file_type)
    template_folder = File.join(ENV["DIR"] || "public", 'site_upload',file_type)
    FileUtils.mkdir_p(template_folder)
    template_folder
  end

  def check_image_filename
    extname = File.extname(file.original_filename).downcase
    [".png",".gif",".jpg",".jpeg",".bmp"].include?(extname)

  end

end
