# encoding: utf-8
class BaseUploader < CarrierWave::Uploader::Base

  # - (Object) convert(format)     格式化
  # - (Object) resize_and_pad(width, height, background = :transparent, gravity = ::Magick::CenterGravity) #调整到合适大小并填充背景颜色，默认为透明色
  # - (Object) resize_to_fill(width, height, gravity = 'Center') 调整大小并剪切到指定大小，参数为位置 (default: 'Center'; options: 'NorthWest', 'North', 'NorthEast', 'West', 'Center', 'East', 'SouthWest', 'South', 'SouthEast')
  # - (Object) resize_to_fit(width, height)      #等比调整大小适应指定大小范围
  # - (Object) resize_to_limit(width, height)    当图片大小大于指定范围时，等比调整大小适应指定大小范围，本来就小的不调整了

  include CarrierWave::MiniMagick

  configure do |config|
    config.remove_previously_stored_files_after_update = false
  end

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    "/images/default/#{model.class.to_s.underscore}/#{mounted_as}/"+  [version_name, ".png"].compact.join('')
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
