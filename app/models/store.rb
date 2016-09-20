class Store
  def initialize(total = 1, store)
    @total = total
    @store = store
  end

  def total
    @total
  end

  def long_name
    store[:longName]
  end

  def city
    store[:city]
  end

  def distance
    store[:distance]
  end

  def phone
    store[:phone]
  end

  def store_type
    store[:storeType]
  end

  def id
    store[:storeId]
  end

  private
  attr_reader :store
end
