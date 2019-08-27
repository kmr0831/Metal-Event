require 'rails_helper'

RSpec.describe 'UsersSignup', type: :system do
  it 'ログインできない' do
    visit new_user_registration_path
    fill_in 'user[name]', with: ''
    fill_in 'user[email]', with: ''
    fill_in 'user[password]', with: ''
    fill_in 'user[password_confirmation]', with: ''
    expect { click_on '送信' }.to_not change { User.count }
    expect(page).to have_content 'サインアップ'
  end
  
end