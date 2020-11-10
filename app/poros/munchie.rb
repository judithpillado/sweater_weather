class Munchie
  attr_reader :id, :name, :address

  def initialize(attribute)
    @id = nil
    @name = attribute[:businesses][0][:name]
    @address = attribute[:businesses][0][:location][:display_address].to_sentence
  end
end
