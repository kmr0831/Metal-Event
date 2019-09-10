require 'rails_helper'

RSpec.describe 'Tickets', type: :system do
  scenario "参加の表明" do
    user = FactoryBot.create(:user)
    event = FactoryBot.create(:event)
    ticket = FactoryBot.build(:ticket)
    
    visit root_path
    click_link "ログイン"
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    click_button "ログイン"
    
    click_link event.name
    click_button "参加する"
    fill_in "ticket[comment]", with: ticket.comment
    click_button "送信"
    visit event_path(event)
    expect(page).to have_content "Comment 1"
    # expect(page.current_path).to eq event_path(event)
  end
end