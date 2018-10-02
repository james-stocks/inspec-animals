class Animal < Inspec.resource(1)
  name 'animal'

  def initialize(name)
    @name = name
  end

  def exist?
    load_data unless @data
    @data.select{ |animal| animal["name"] == @name }.length > 0
  end

  def species
    load_data unless @data
    return '' unless exist?
    @data.select{ |animal| animal["name"] == @name }.first["species"]
  end

private
  @name
  @data = nil

  def load_data
    @data = JSON.parse(File.read('animals.json'))
  end
end
