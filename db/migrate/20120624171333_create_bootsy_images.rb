# frozen_string_literal: true
class CreateBootsyImages < ActiveRecord::Migration
  def change
    create_table :bootsy_images do |t|
      t.attachment :image_file
      t.references :image_gallery
      t.timestamps
    end
  end
end
