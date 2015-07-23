require "rails_helper"

RSpec.describe Micropost, type: :model do
  let(:attr) do
    { content: "Example content", user_id: "1" }
  end
  
  it "should create a new instance given valid attributes" do
    Micropost.create! attr
  end
  
  it "should require content name" do
    no_name_content = Micropost.new attr.merge content: ""
    expect(no_name_content).to be_invalid
  end
  
    it "should require content valid user id" do
    valid_user_id = Micropost.new attr.merge user_id: ""
    expect(valid_user_id).to be_invalid
  end
end