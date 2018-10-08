class Animals < Inspec.resource(1)
  name 'animals'

  # FilterTable setup
  filter_table_config = FilterTable.create
  filter_table_config.register_column(:names, field: :name)
  filter_table_config.register_column(:species, field: :species)
  filter_table_config.register_column(:weights, field: :weight)
  filter_table_config.install_filter_methods_on_resource(self, :data)

private
  @data = nil

  def data
    unless @data
      @data = JSON.parse(inspec.http('https://s3.eu-west-2.amazonaws.com/compliance-demo-assets/animals.json').body)
      @data.map! { |entry| Hash[entry.map { |k,v| [k.to_sym, v] }] }
    end
    @data
  end
end
