require_relative '../../config/initializers/shrine'
require "image_processing/mini_magick"

class ImageUploader < Shrine
  plugin :derivatives
  plugin :derivation_endpoint,
         secret_key: "52750b30ffbc7de3b362",
         prefix: "derivations/image"
  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)

    {
      large: magick.resize_to_limit!(800, 800),
      medium: magick.resize_to_limit!(500, 500),
      small: magick.resize_to_limit!(50, 50)
    }
    derivation :thumbnail do |file, width, height|
      ImageProcessing::MiniMagick
        .source(file)
        .resize_to_limit!(width.to_i, height.to_i)
    end
  end
end