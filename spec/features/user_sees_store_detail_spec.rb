require 'rails_helper'

RSpec.feature "User can view one stores info" do
    scenario "when they click on store name" do
      VCR.use_cassette("store_info") do
        visit '/'

        fill_in "zip", with: "80202"
        click_on "search"

        click_on "Best Buy Mobile - Cherry Creek Shopping Center"

        expect(current_path).to eq(store_path(2740))
        expect(page).to have_content("Cherry Creek Shopping Center")
        expect(page).to have_content("Store Type: Mobile")
        expect(page).to have_content("Address: 3000 East First Ave #296, Denver, CO, 80206")

        within(".hours-list") do
          within("li:first") do
            expect(page).to have_content("Mon: 10am-9pm")
          end
          within("li:nth-child(2)") do
            expect(page).to have_content("Tue: 10am-9pm")
          end
          within("li:nth-child(3)") do
            expect(page).to have_content("Wed: 10am-9pm")
          end
          within("li:nth-child(4)") do
            expect(page).to have_content("Thurs: 10am-9pm")
          end
          within("li:nth-child(5)") do
            expect(page).to have_content("Fri: 10am-9pm")
          end
          within("li:nth-child(6)") do
            expect(page).to have_content("Sat: 10am-9pm")
          end
          within("li:nth-child(7)") do
            expect(page).to have_content("Sun: 11am-6pm")
          end
        end
        end
      end
    end
