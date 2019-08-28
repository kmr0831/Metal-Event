require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'GET #new' do
    context '未ログインユーザーがアクセスしたとき' do
      before { get :new }
      
      it 'ステータスコード500が返ること' do
        expect(response.status).to eq(500)
      end
    end
    
    # context 'ログインユーザーがアクセスしたとき' do
    #   before do
    #     User.new(name: 'Example', email: 'Example', password: 'password', password_confirmation: 'password')
    #     get :new
    #   end
      
    #   it 'ステータスコード200が返ること' do
    #     expect(response.status).to eq(200)
    #   end
    # end
  end
end
