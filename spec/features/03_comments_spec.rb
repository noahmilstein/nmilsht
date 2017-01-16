require 'spec_helper'
require 'rails_helper'

feature 'blog posts', %Q{
  As an unauthenticated user
  I want to create and delete comments
} do

  let!(:post) { FactoryGirl.create(:post) }
  let!(:comment) { FactoryGirl.create(:comment, post: post) }

  scenario 'create post comment' do
    visit post_path(post)
    fill_in 'Name', with: "comment title"
    fill_in 'Body', with: "This is a comment body"
    click_button 'Create Comment'
    expect(page).to have_content("This is a comment body")
  end

  scenario 'delete post comment', js: true do
    visit post_path(post)
    click_link 'Delete Comment'

    expect(page).to_not have_content(comment.name)
    expect(page).to_not have_content(comment.body)
  end
end
