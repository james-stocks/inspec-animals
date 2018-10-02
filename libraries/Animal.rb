class Animal < Inspec.resource(1)
  name 'animal'

  def initialize(name)
    @name = name
  end

  def exist?
    false
  end

  def species
    'unimplemented'
  end

private
  @name
  @data = nil
end
