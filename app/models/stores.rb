class Stores
  def initialize(store)
    @store = store
  end

  def self.stores_by_zip(zip)
    raw_stores = StoreService.new.get_stores_by_zip(zip)
    raw_stores.each do |store|
      require "pry"; binding.pry
      Stores.new(store)
    end
  end

  def long_name
  end

  def city
  end

  def distance
  end

  def phone_number
  end

  def store_type

  end

end
