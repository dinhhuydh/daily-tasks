require 'rails_helper'

RSpec.describe "Home page", type: :request do
  describe "GET /" do
    it "renders home page" do
      get '/'
      expect(response).to have_http_status(302)
    end
  end
end
