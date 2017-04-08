# frozen_string_literal: true
require 'rails_helper'

describe Bootsy::Image do
  describe '#image_file' do
    it 'is a Paperclip attachment' do
      expect(subject.image_file).to be_a(Paperclip::Attachment)
    end

    it 'is required' do
      subject.valid?

      expect(subject.errors[:image_file].size).to eq 1
    end
  end
end
