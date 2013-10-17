Given 'there is a post with images' do
  post = Post.new title: 'Test', content: 'test'
  post.bootsy_image_gallery_id = FactoryGirl.create(:image_gallery_with_images).id
  post.save!
end

Then 'I see the image gallery' do
  expect(page).to have_css('.bootsy-modal', visible: true)
end

Then /^the image gallery should( not)? be empty$/ do |negate|
  expectation = negate ? :should : :should_not
  page.send expectation, have_css('.bootsy-image', visible: true)
end