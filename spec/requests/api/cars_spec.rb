require "rails_helper"

RSpec.describe "Api::Cars", type: :request do
  let(:brand) { create :brand }
  let!(:car) { create :car, brand: brand }
  describe "GET /index" do
    it "returns OK" do
      get api_cars_path
      expect(response).to have_http_status(:ok)
    end

    it "returns a list of all cars in json" do
      get api_cars_path
      json_body = JSON.parse(response.body, symbolize_names: true)
      expect(json_body.length).to eq 1
      expect(json_body.first.keys).to contain_exactly(:brand_id, :created_at, :id, :name, :updated_at, :year)
    end
  end

  describe "POST :create" do
    context "when params are not valid" do
      let(:params) do
        {
          car: {foo: "bad"}
        }
      end

      it "returns bad request" do
        post "/api/cars", params: params
        expect(response).to have_http_status(:bad_request)
      end

      it "does not create a new car" do
        expect { post "/api/cars", params: params }.not_to change { Car.count }
      end
    end

    context "when params are valid" do
      let(:params) do
        {
          car: {name: "crosstrek", brand_id: brand.id}
        }
      end

      it "returns OK" do
        post "/api/cars", params: params
        expect(response).to have_http_status(:ok)
      end

      it "creates a new car" do
        expect { post "/api/cars", params: params }.to change { Car.count }
      end
    end
  end
end
