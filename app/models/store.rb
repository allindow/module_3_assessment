class Store
  def initialize(total, store)
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

  private
  attr_reader :store
end
