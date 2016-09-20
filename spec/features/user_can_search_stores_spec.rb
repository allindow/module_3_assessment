require 'rails_helper'

RSpec.feature "User can search for stores" do
  scenario "by zip code" do
    visit '/'

    fill_in("Search"), with: "80202"
    click_on "search"

    expect(current_path).to eq("/search")

    expect(page).to have_content("17 Total Stores")
    expect(page).to have_selector("li", count: 17)
  end
end
