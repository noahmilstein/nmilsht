require 'spec_helper'
require 'rails_helper'

feature 'sign up', %Q{
  As an unauthenticated user
  I want to sign up
  so that I can generate new blog posts
} do

  let(:user) { User.new(email: 'noahamilstein@gmail.com', password: 'password') }
  let!(:user2) { FactoryGirl.create(:user) }

  scenario 'specify valid and required information' do
    fill_sign_up_form(user)

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_selector(:link_or_button, 'Sign Out')
  end

  scenario 'required information is not supplied' do
    visit new_user_registration_path
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_button 'Sign up'

    expect(page).to have_content("Email can't be blank")
  end

  scenario "password and confirmation don't match" do
    visit new_user_registration_path
    fill_in 'Email', with: user2.email
    fill_in 'Password', with: user2.password
    fill_in 'Password confirmation', with: 'mustache'
    click_button 'Sign up'

    expect(page).to have_content("Password confirmation doesn't match")
  end

  scenario 'new user session' do
    fill_sign_up_form(user)
    click_button 'Sign Out'
    fill_sign_in_form(user)

    expect(page).to have_content('Signed in successfully')
  end
end
