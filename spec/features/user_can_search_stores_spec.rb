require 'rails_helper'

RSpec.feature "User can search for stores" do
    scenario "by zip code" do
      VCR.use_cassette("search_by_zip") do
        visit '/'

        fill_in "zip", with: "80202"
        click_on "search"

        expect(current_path).to eq("/search")

        expect(page).to have_content("17 Total Stores")

        within(".stores-list") do
          expect(page).to have_selector("li", count: 15)
        end
      end
    end
  end
