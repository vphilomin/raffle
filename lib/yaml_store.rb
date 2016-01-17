require 'yaml/store'

class YamlStore
  def initialize(store_name_provider)
    @store_name_provider = store_name_provider
  end

  def write(winner, prize)
    store = YAML::Store.new(store_name_provider.name)
    store.transaction do
      store["winners"] ||= {}
      store["winners"][winner] = prize 
    end
  end

  def read
    store = YAML::Store.new(store_name_provider.name)
    store.transaction do
      store["winners"] ||= {}
    end
  end

  private

  attr_reader :store_name_provider
end
