class Client
  attr_reader(:name, :id, :stylist_id)

  define_method(:initialize) do |attributes|
      @name = attributes.fetch(:name)
      @id = attributes.fetch(:id)
      @stylist_id = attributes.fetch(:stylist_id)
  end
end
