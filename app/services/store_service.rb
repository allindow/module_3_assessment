class StoreService
  def initialize
    @connection = Faraday.new("http://api.bestbuy.com/v1/")
    @connection.params["apiKey"] = ENV["BEST_BUY_KEY"]
    @connection.params["format"] = "json"
  end

  def get_stores_by_zip(zip)
    response = @connection.get "stores((area(#{zip},25)))"
    raw_data = parse(response.body)
    require "pry"; binding.pry
  end

  def parse(response)
    JSON.parse(response, symbolize_names: true)
  end
end
