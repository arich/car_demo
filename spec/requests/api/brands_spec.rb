require "rails_helper"

RSpec.describe "Api::Brands", type: :request do
  describe "GET /index" do
    let!(:brand) { create :brand }

    it "returns OK" do
      get api_brands_path
      expect(response).to have_http_status(:ok)
    end

    it "returns a list of all brands in json" do
      get api_brands_path
      json_body = JSON.parse(response.body, symbolize_names: true)
      expect(json_body.length).to eq 1
      expect(json_body.first.keys).to contain_exactly(:id, :name, :updated_at, :created_at)
    end
  end

  describe "POST :create" do
    context "when params are not valid" do
      let(:params) do
        {
          brand: {foo: "bad"}
        }
      end

      it "returns bad request" do
        post "/api/brands", params: params
        expect(response).to have_http_status(:bad_request)
      end

      it "does not create a new brand" do
        expect { post "/api/brands", params: params }.not_to change { Brand.count }
      end
    end

    context "when params are valid" do
      let(:params) do
        {
          brand: {name: "volvo"}
        }
      end

      it "returns OK" do
        post "/api/brands", params: params
        expect(response).to have_http_status(:ok)
      end

      it "creates a new brand" do
        expect { post "/api/brands", params: params }.to change { Brand.count }
      end
    end
  end
end
