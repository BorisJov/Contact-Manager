require 'rails_helper'

RSpec.describe "EmailAdresses", type: :request do
  describe "GET /email_adresses" do
    it "works! (now write some real specs)" do
      get email_adresses_path
      expect(response).to have_http_status(200)
    end
  end
end
