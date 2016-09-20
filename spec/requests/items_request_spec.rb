require 'rails_helper'

RSpec.describe "Items requests", type: :request do
  after(:each) do
    expect(response).to be_success
  end

  it "should get all items" do
    Item.create(name: "thing1", description: "description1", image_url: "https://robohash.org/1")
    Item.create(name: "thing2", description: "description2", image_url: "https://robohash.org/2")

    get 'api/v1/items'

    expect(json(response).count).to eq(2)
    expect(json(response).first["name"]).to eq("thing1")
    expect(json(response).first["description"]).to eq("description1")
    expect(json(response).first["image_url"]).to eq("https://robohash.org/1")
    expect(json(response).last["description"]).to eq("description2")
    expect(json(response).last["image_url"]).to eq("https://robohash.org/2")
    expect(json(response).last["name"]).to eq("thing2")
  end

  def json(response)
    JSON.parse(response.body)
  end
end
