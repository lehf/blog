class Admin::FilesController < Admin::BaseController
  #上传图片
  def image_upload
    render :json=>"不是图片",:status => 500 and return unless check_image_filename(params[:file])
    file_name,file_path=upload_file(params[:file],"images")
    respond_to do |format|

      format.json {render :json=>{:link=>file_path}}
      format.html {render :text => file_path}
    end
  end
  #上传文件
  def file_upload
    file_name,file_path=upload_file(params[:file],"files")
    respond_to do |format|
      format.json {render :json=>{:link=>file_path}}
      format.html {render :text => file_path}
    end
  end
  #管理图片
  def image_manage
    @images=[]
    path="#{Rails.root}/#{upload_folder("images")}"
    Dir.foreach(path) do |filename|
      if filename != "." and filename != ".." and filename != ".DS_Store"
        file="#{path}/#{filename}"
        @images << {:url=>"/site_upload/images/#{File.basename(file)}",:thump=>"/site_upload/images/#{File.basename(file)}",:tag=>File.basename(file)}
      end
    end
    respond_to do |format|
      format.json {render :json=>@images,:root=>false}
      format.html


    end
  end
  #删除图片
  def image_delete
    FileUtils.rm_rf("#{Rails.root}#{params[:src]}")
    render :text => "ok"
  end

  private
  def upload_file(file,file_type)
    if !file.original_filename.empty?
      filename = file.original_filename
      folder=upload_folder(file_type)
      file_path=File.join(folder,filename)
      #写入文件
      ##wb 表示通过二进制方式写，可以保证文件不损坏
      File.open(file_path, "wb") do |f|
        f.write(file.read)
      end
      file_url="/site_upload/#{file_type}/#{filename}"
      return filename,file_url
    end
  end

  def upload_folder(file_type)
    template_folder = File.join(ENV["DIR"] || "public", 'site_upload',file_type)
    FileUtils.mkdir_p(template_folder)
    template_folder
  end

  def check_image_filename(file)
    extname=File.extname(file.original_filename).downcase
    [".png",".gif",".jpg",".jpeg",".bmp"].include?(extname)
  end
end

