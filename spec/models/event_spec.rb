require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:event) { FactoryBot.build(:event) }
  describe "#name" do
    it "有効" do
      expect(event).to be_valid
    end
    
    it "空白のとき" do
      event.name = ""
      
      expect(event.valid?).to_not be_truthy
    end
    
    it "50字のとき" do
      event.name = "a" * 50
      
      expect(event).to be_truthy
    end
    
    it "51字のとき" do
      event.name = "a" * 51
      
      expect(event).to_not be_valid
    end
  end
  
  describe '#place' do
    context '空白の時' do
      let(:event) { Event.new(place: '') }
      
      it 'valid でないこと' do
        expect(event.valid?).to be_falsey
      end
    end
    
    context '101字の時' do
      let(:event) { Event.new(place: 'a' * 101) }
      
      it 'valid でないこと' do
        expect(event.valid?).to be_falsey
      end
    end
    
  end
  
  describe '#content' do
    context '空白の時' do
      let(:event) { Event.new(content: '') }
      
      it 'valid でないこと' do
        expect(event.valid?).to be_falsey
      end
    end 
    
    context '1001字の時' do
      let(:event) { Event.new(content: 'a' * 1001)}
      
      it 'valid でないこと' do
        expect(event.valid?).to be_falsey
      end
    end
  end
  
  describe '#start_time' do
    context '空白の時' do
      let(:event) { Event.new(start_time: '') }
      
      it 'valid でないこと' do
        expect(event.valid?).to be_falsey
      end
    end
  end
  
  describe '#end_time' do
    context '空白の時' do
      let(:event) { Event.new(end_time: '') }
      
      it 'valid でないこと' do
        expect(event.valid?).to be_falsey
      end
    end
  end
  
end