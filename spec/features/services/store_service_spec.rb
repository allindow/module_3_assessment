require 'rails_helper'

describe StoreService do
  context "stores" do
    it "filters stores within 25 miles by zipcode" do
      VCR.use_cassette("stores_by_zip") do
        stores = StoreService.new.get_stores_by_zip("80202")

        expect(stores["total"]).to eq("17")
        
      end
    end

  end
end
