require 'rails_helper'

RSpec.describe Ticket, type: :model do
  it "30字以下は許可" do
    ticket = FactoryBot.build(:ticket)
    ticket.comment = "a" * 30
    
    expect(ticket).to be_valid
  end
  
  it "31字以上は不可" do
    ticket = FactoryBot.build(:ticket)
    ticket.comment = "a" * 31
    
    expect(ticket).to_not be_valid
  end
end
