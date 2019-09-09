require 'rails_helper'

RSpec.describe 'Events', type: :system do
  scenario "イベント作成" do
    user = FactoryBot.create(:user)
    category = FactoryBot.create(:category)
    
    visit root_path
    click_link "ログイン"
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    click_button "ログイン"
    click_link "イベント作成"
    fill_in "event[name]", with: "Test"
    fill_in "event[place]", with: "Test"
    select "2019", from: "event[start_time(1i)]"
    select "1月", from: "event[start_time(2i)]"
    select "1", from: "event[start_time(3i)]"
    select "00", from: "event[start_time(4i)]"
    select "00", from: "event[start_time(5i)]"
    select "2019", from: "event[end_time(1i)]"
    select "1月", from: "event[end_time(2i)]"
    select "1", from: "event[end_time(3i)]"
    select "01", from: "event[end_time(4i)]"
    select "00", from: "event[end_time(5i)]"
    select category.name, from: "カテゴリー"
    fill_in "event[content]", with: "Test"
    click_button "作成"
    
    expect(page).to have_selector "h1", text: "Test"
  end
end