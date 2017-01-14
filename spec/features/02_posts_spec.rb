require 'spec_helper'
require 'rails_helper'

feature 'blog posts', %Q{
  As an unauthenticated user
  I want to create, edit, and delete posts
} do

  let!(:user) { FactoryGirl.create(:user) }
  let(:post) { Post.new(title: "testing posts title", body: "testing posts body, minimum 20 chars") }
  let(:post2) { Post.new(title: "testing posts edit title", body: "testing posts edit body, minimum 20 chars") }

  scenario "create blog post" do
    fill_sign_in_form(user)
    fill_post_form(post)

    expect(page).to have_content(post.title)
    expect(page).to have_content(post.body)
  end

  scenario "edit blog post" do
    fill_sign_in_form(user)
    fill_post_form(post2)

    expect(page).to have_content(post2.title)
    expect(page).to have_content(post2.body)
  end

  scenario "delete blog post" do
    # visit new_user_registration_path
    # fill_in "Email", with: user2.email
    # fill_in "Password", with: user2.password
    # fill_in "Password confirmation", with: "mustache"
    # click_button 'Sign up'
    #
    # expect(page).to have_content("Password confirmation doesn't match")
  end
end
