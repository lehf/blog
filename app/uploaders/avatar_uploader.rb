class AvatarUploader < BaseUploader

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
   include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  def default_url
    "/images/default/#{model.class.to_s.underscore}/#{mounted_as}/"+  [version_name, ".png"].compact.join('')
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
   version :default do
     process :resize_to_fill => [500, 500]
     process :convert => 'png'
     def full_filename (for_file = model.logo.file)
       "max_500*500.png"
     end
   end

   version :medium do
     process :resize_to_fill => [250, 250]
     process :convert => 'png'
     def full_filename (for_file = model.logo.file)
       "medium_250*250.png"
     end
   end

   version :thumb do
     process :resize_to_fill => [125, 125]
     process :convert => 'png'
     def full_filename (for_file = model.logo.file)
       "thumb_125*125.png"
     end
   end

end
