class Animal < Inspec.resource(1)
  name 'animal'

  def initialize(name)
    @name = name
  end

  def exist?
    data.select{ |animal| animal["name"] == @name }.length > 0
  end

  def species
    return '' unless exist?
    data.select{ |animal| animal["name"] == @name }.first["species"]
  end

private
  @name
  @data = nil

  def data
    @data ||= JSON.parse(inspec.http('https://s3.eu-west-2.amazonaws.com/compliance-demo-assets/animals.json').body)
  end
end
