require 'spec_helper'
require 'rails_helper'

feature 'blog posts', %Q{
  As an unauthenticated user
  I want to create, edit, and delete posts
} do

  let!(:user) { FactoryGirl.create(:user, email: ENV['ADMIN']) }
  let!(:post1) { FactoryGirl.create(:post) }
  let(:post2) { Post.new(title: 'testing posts title', body: 'testing posts body, minimum 20 chars') }

  before :each do
    fill_sign_in_form(user)
  end

  scenario 'edit blog post' do
    visit posts_path
    edit_post_form(post2)

    expect(page).to have_content(post2.title)
    expect(page).to have_content(post2.body)
  end

  scenario 'delete blog post' do
    visit post_path(post1)
    click_link 'Delete'

    expect(page).to_not have_content(post1.title)
    expect(page).to_not have_content(post1.body)
  end

  scenario 'create blog post' do
    fill_post_form(post2)

    expect(page).to have_content(post2.title)
    expect(page).to have_content(post2.body)
  end
end
