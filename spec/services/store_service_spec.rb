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

    it "gets one stores info by store ID" do
      VCR.use_cassette("one_stores_info") do
        store = StoreService.new.get_store_info_by_id("2730")

        expect(store[:stores].count).to eq(1)
        expect(store[:stores].first[:name]).to eq("Town Center at Aurora")
        expect(store[:stores].first[:phone]).to eq("303-326-0848")
        expect(store[:stores].first[:address]).to eq("14200 East Alameda Avenue")
      end

    end

  end
end
