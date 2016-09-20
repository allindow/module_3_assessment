class Stores < OpenStruct
  def self.service
    StoreService.new
  end

  def self.stores_by_zip(zip)
    raw_data = service.get_stores_by_zip(zip)
    raw_stores = raw_data[:stores]
    total = raw_data[:total]
    raw_stores.map do |store|
      Store.new(total, store)
    end
  end

end
