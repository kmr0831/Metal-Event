require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:event) { FactoryBot.create(:event) }
  describe "#create" do
    it "参加表明" do
      ticket = FactoryBot.attributes_for(:ticket)
      sign_in user
      post :create, params: { event_id: event.id, ticket: ticket }
      
      expect(response).to have_http_status "201"
    end
    
    it "ログインしてなければログイン画面にリダイレクト" do
      ticket = FactoryBot.attributes_for(:ticket)
      post :create, params: { event_id: event.id, ticket: ticket }
      
      expect(response).to redirect_to new_user_session_path
    end
  end
  
  describe "#destroy" do
    # let!(:ticket) { FactoryBot.attributes_for(:ticket) }
    pending "参加をキャンセル" do
      ticket = user.tickets.create!(comment: "Comment 1")
      sign_in user
      delete :destroy, params: { event_id: event.id, id: ticket.id }
      
      expect(response).to redirect_to event_path(event)
    end
  end
end
