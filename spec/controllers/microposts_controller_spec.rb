require "rails_helper"

RSpec.describe MicropostsController, type: :controller do
  describe "GET #index" do
    let(:attr1) do
      { content: "Example content1", user_id: "1" }
    end
    
    let(:attr2) do
      { content: "Example content2", user_id: "2" }
    end
    
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
    
    it "loads all of the microposts into @microposts" do
      micropost1, micropost2 = Micropost.create!(attr1), Micropost.create!(attr2)
      get :index
      expect(assigns(:microposts)).to match_array([micropost1, micropost2])
    end
  end
end  
  