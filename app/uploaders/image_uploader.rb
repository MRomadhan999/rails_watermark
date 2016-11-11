class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb_profile do
    process :resize_to_fill => [370, 229]
    process :watermark => "#{Rails.root}/public/chrome.png"
  end

  def watermark(path_to_file)
    manipulate! do |img|
      img = img.composite(MiniMagick::Image.open(path_to_file), "jpg") do |c|
        c.gravity "SouthEast"
      end
    end
  end
end
