require 'rails_helper'

describe StoreService do
  context "stores" do
    it "filters stores within 25 miles by zipcode" do
      VCR.use_cassette("stores_by_zip") do
        stores = StoreService.new(ENV['BEST_BUY_KEY']).get_stores_by_zip
        
      end
    end

  end
end
