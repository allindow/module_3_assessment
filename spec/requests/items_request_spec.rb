require 'rails_helper'

RSpec.describe "Items requests", type: :request do

  it "should get all items" do
    Item.create(name: "thing1", description: "description1", image_url: "https://robohash.org/1")
    Item.create(name: "thing2", description: "description2", image_url: "https://robohash.org/2")

    get 'api/v1/items'

    expect(response).to be_success
    expect(json(response).count).to eq(2)
    expect(json(response).first["name"]).to eq("thing1")
    expect(json(response).first["description"]).to eq("description1")
    expect(json(response).first["image_url"]).to eq("https://robohash.org/1")
    expect(json(response).last["description"]).to eq("description2")
    expect(json(response).last["image_url"]).to eq("https://robohash.org/2")
    expect(json(response).last["name"]).to eq("thing2")
  end

  it "should get an item by ID" do
    Item.create(name: "thing1", description: "description1", image_url: "https://robohash.org/1")

    get 'api/v1/items/1'

    expect(response).to be_success
    expect(json(response).count).to eq(3)
    expect(json(response)["name"]).to eq("thing1")
    expect(json(response)["description"]).to eq("description1")
    expect(json(response)["image_url"]).to eq("https://robohash.org/1")
  end

  it "should delete an item by id" do
    Item.create(name: "thing1", description: "description1", image_url: "https://robohash.org/1")
    expect(Item.count).to eq(1)

    delete 'api/v1/items/1'

    expect(response.status).to eq(204)
    expect(response.message).to eq("No Content")
    expect(Item.count).to eq(0)
  end

  def json(response)
    JSON.parse(response.body)
  end
end
