# encoding: utf-8
# copyright: 2018, The Authors

min_croc_weight = attribute('min_croc_weight')

control 'Check my animals' do
  impact 1.0
  title 'Check my animals'
  describe animals.where(name: 'Alice') do
    it { should exist }
    its('species') { should eq ['Aardvark'] }
  end

  describe animals.where(name: 'Barry') do
    it { should_not exist }
  end

  describe animals.where{ species == 'Crocodile' && weight < min_croc_weight } do
    its('raw_data') { should be_empty }
  end
end
