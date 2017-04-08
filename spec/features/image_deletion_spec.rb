# frozen_string_literal: true
require 'rails_helper'

describe 'image deletion', type: :feature, js: true do
  let(:selector) do
    # xpath selector "//div[contains(@class, 'bootsy-gallery')]//img[contains(@src, 'test.jpg')]"
    '.bootsy-gallery img[src*="thumb/test.jpg"]:first-child'
  end

  before do
    visit new_post_path
    click_on 'Insert image'
    attach_file 'image[image_file]', Rails.root.to_s + '/public/test.jpg'
    sleep 2 # TODO: fix issue #1 fins(:css, selector) fails without sleep
  end

  it 'fails whithout sleep' do
    find(:css, selector).click
  end

  it 'can be interrupted' do
    find(:css, selector).click

    page.dismiss_confirm 'Are you sure you want to delete this image?' do
      click_link 'Delete'
    end

    expect(page).to have_selector(:css, selector, visible: true)
  end

  it 'can be performed' do
    find(:css, selector).click

    page.accept_confirm 'Are you sure you want to delete this image?' do
      click_link 'Delete'
    end

    expect(page).not_to have_selector(:css, selector, visible: true)
    expect(page).to have_content('There are currently no uploaded images.')
  end
end
