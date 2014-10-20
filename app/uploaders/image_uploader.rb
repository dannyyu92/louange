# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :fog
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def filename
    "#{model.id}.#{model.file.extension}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    ActionController::Base.helpers.asset_path("placeholders/" + ["default", version_name].compact.join('_')) + ".png"
    return "/images/placeholders/" + ["default", version_name].compact.join('_') + ".png"
  end

  # This is for Amazon S3 jpeg issue
  process :set_content_type_to_jpeg_if_jpg
  def set_content_type_to_jpeg_if_jpg(*args)
    self.file.instance_variable_set(:@content_type, "image/jpeg") if file.content_type == "image/jpg"
  end

  VERSION_SIZES = {
    :original => [800, 800],
    :square => [800, 800],
    #:medium => [400, 400],
    :thumb => [240, 240]
  }
  
  process :resize_to_fit => VERSION_SIZES[:original]
  
  # defaults
  def size
    return {
      :width => VERSION_SIZES[:original][0],
      :height => VERSION_SIZES[:original][1]
    }
  end
  
  # alternate versions
  version :square do
    process :resize_to_fill => VERSION_SIZES[:square]
    def size
      return {
        :width => VERSION_SIZES[:square][0],
        :height => VERSION_SIZES[:square][1]
      }
    end
  end

  version :medium do
    process :resize_to_fit => VERSION_SIZES[:medium]
    def size
      return {
        :width => VERSION_SIZES[:medium][0],
        :height => VERSION_SIZES[:medium][1]
      }
    end
  end

  version :thumb do
    process :resize_to_fill => VERSION_SIZES[:thumb]
    def size
      return {
        :width => VERSION_SIZES[:thumb][0],
        :height => VERSION_SIZES[:thumb][1]
      }
    end
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end