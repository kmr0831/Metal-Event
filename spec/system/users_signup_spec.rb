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
  
  it 'ログインできる' do
    visit new_user_registration_path
    fill_in 'user[name]', with: 'Example'
    fill_in 'user[email]', with: 'example@example.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    expect { click_on '送信'}.to change { User.count }.by(1)
    expect(page).to have_content 'イベント一覧'
  end
end