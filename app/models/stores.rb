class Stores < OpenStruct
  def self.service
    StoreService.new
  end

  def self.stores_by_zip(zip)
    raw_stores = service.get_stores_by_zip(zip)[:stores]
    total = raw_stores[:total]
    raw_stores.map do |store|
      Store.new(total, store)
    end
  end

end
