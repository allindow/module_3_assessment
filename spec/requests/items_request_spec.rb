require 'rails_helper'

RSpec.describe "Items requests", type: :request do
  after(:each) do
    expect(response).to be_success
  end

  it "should get all items" do
    Item.create(name: "thing1", description: "description1", image_url: "https://robohash.org/1")
    Item.create(name: "thing2", description: "description2", image_url: "https://robohash.org/2")

    get 'api/v1/items'
    require "pry"; binding.pry
    expect(json.count).to eq(2)
    expect(json.first[:name]).to eq("thing1")
    expect(json.last[:name]).to eq("thing2")
  end
end
