require 'rails_helper'

RSpec.describe "Home page", type: :request do
  describe "GET /" do
    it "renders home page" do
      get '/'
      expect(response).to have_http_status(200)
    end
  end
end
