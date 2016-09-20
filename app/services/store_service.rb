class StoreService
  def initialize
    @connection = Faraday.new("http://api.bestbuy.com/v1/")
    @connection.params["apiKey"] = ENV["BEST_BUY_KEY"]
    @connection.params["format"] = "json"
  end

  def get_stores_by_zip(zip)
    @connection.params["pageSize"] = "15"
    response = @connection.get "stores((area(#{zip},25)))"
    parse(response.body)
  end

  def parse(response)
    JSON.parse(response, symbolize_names: true)
  end
end
