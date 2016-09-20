require 'rails_helper'

RSpec.feature "User can search for stores" do
    scenario "by zip code" do
      VCR.use_cassette("search_by_zip") do
        visit '/'

        fill_in "zip", with: "80202"
        click_on "search"

        click_on "Best Buy Mobile - Cherry Creek Shopping Center"

        expect(current_path).to eq(store_path())
        expect(page).to have_content("Best Buy Mobile - Cherry Creek Shopping Center")
        expect(page).to have_content("Store Type: Mobile")
        expect(page).to have_conent("")
        end
      end
    end
  end
