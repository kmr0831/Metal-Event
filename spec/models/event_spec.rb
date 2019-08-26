require 'rails_helper'

RSpec.describe Event, type: :model do
  describe '#name' do
    context 'nilのとき' do
      let(:event) { Event.new(name: '') }
      
      it 'valid でないこと' do
        event.valid?
        expect(event.errors[:name]).to be_present
      end
    end
    
    context '空白の時' do
      let(:event) { Event.new(name: '') }
      
      it 'valid でないこと' do
        event.valid?
        expect(event.errors[:name]).to be_present
      end
    end
    
    context 'オフ会のとき' do
      let(:event) { Event.new(name: 'オフ会') }
      
      it 'valid であること' do
        event.valid?
        expect(event.errors[:name]).to be_blank
      end
    end
    
    context '50字のとき' do
      let(:event) { Event.new(name: 'a' * 50) }
      
      it 'valid であること' do
        event.valid?
        expect(event.errors[:name]).to be_blank
      end
    end
    
    context '51字のとき' do
      let(:event) { Event.new(name: 'a' * 51) }
      
      it 'valid でないこと' do
        event.valid?
        expect(event.errors[:name]).to be_present
      end
    end
    
  end
end
