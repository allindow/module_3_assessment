require 'rails_helper'

describe StoreService do
  context "stores" do
    it "filters stores within 25 miles by zipcode" do
      VCR.use_cassette("stores_by_zip") do
        stores = StoreService.new.get_stores_by_zip("80202")

        expect(stores[:total]).to eq(17)
        expect(stores[:stores].count).to eq(15)
        expect(stores[:stores].first[:name]).to eq("Cherry Creek Shopping Center")
        expect(stores[:stores].last[:name]).to eq("S.E. Aurora")
      end
    end

  end
end
