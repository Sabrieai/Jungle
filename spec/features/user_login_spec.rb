require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  scenario "They can login" do
    @user = User.create(first_name: "Buster",last_name:"Zippa", email: "buzz@cuts.com", password: "zzzsleep", password_confirmation: "zzzsleep")
    expect(@user).to be_present

   # ACT
   visit new_session_path

   save_screenshot('Login_page.png')
   
   #fill in form
   fill_in 'email', with: "#{@user.email}"
   fill_in 'password', with: "#{@user.password}"

   save_screenshot('login_filled.png')

   #press login button
   click_on 'Submit'

   #checks if they are redirected to homepage
   expect(page).to have_content('Logout')

   save_screenshot('logged_in.png')
  end
end
