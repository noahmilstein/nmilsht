require 'spec_helper'
require 'rails_helper'

feature 'blog posts', %Q{
  As an unauthenticated user
  I want to create, edit, and delete posts
} do

  let!(:user) { FactoryGirl.create(:user) }
  let(:post) { Post.new(title: 'testing posts title', body: 'testing posts body, minimum 20 chars') }
  let(:post2) { Post.new(title: 'testing posts edit title', body: 'testing posts edit body, minimum 20 chars') }
  let!(:post3) { FactoryGirl.create(:post) }

  before :each do
    fill_sign_in_form(user)
  end

  scenario 'create blog post' do
    fill_sign_in_form(user)
    fill_post_form(post)

    expect(page).to have_content(post.title)
    expect(page).to have_content(post.body)
  end

  scenario 'edit blog post' do
    fill_sign_in_form(user)
    edit_post_form(post3)

    expect(page).to have_content(post3.title)
    expect(page).to have_content(post3.body)
  end

  xscenario 'delete blog post' do
    fill_sign_in_form(user)
    fill_post_form(post)
    visit posts_path
    # capybara can't find dom element
    click_link 'Destroy'

    expect(page).to not_have_content(post.title)
    expect(page).to not_have_content(post.body)
    expect(page).to have_content('New Post')
  end
end
