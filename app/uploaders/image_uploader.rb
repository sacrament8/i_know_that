class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  version :thumb do
    process resize_to_fit: [600, 600]
  end
  if Rails.env.development?
    storage :file
  elsif Rails.env.test?
    storage :file
  else
    storage :fog
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def cache_dir
    "cache"
  end

  def extension_whitelist
    %w(png jpg jpeg gif)
  end

  def filename
    "image_#{model.id}.#{file.extension}" if original_filename
  end
end
