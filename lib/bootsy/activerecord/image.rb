# frozen_string_literal: true
module Bootsy
  # Public: Model to reference the actual image stored trough Bootsy.
  # It contains the Paperclip configuration and belongs to a
  # particular image gallery.
  class Image < ActiveRecord::Base
    belongs_to :image_gallery, touch: true

    has_attached_file :image_file,
    styles: { large: "#{Bootsy.large_image[:width]}x#{Bootsy.large_image[:height]}>",
              medium: "#{Bootsy.medium_image[:width]}x#{Bootsy.medium_image[:height]}>",
              small: "#{Bootsy.small_image[:width]}x#{Bootsy.small_image[:height]}>",
              thumb: "60x60>", },
    default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image_file, content_type: /\Aimage\/.*\z/

    validates_presence_of :image_file, :image_gallery_id
  end
end
