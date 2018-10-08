# encoding: utf-8
# copyright: 2018, The Authors

title 'Animals'

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

  describe animals.where{ species == 'Crocodile' && weight.to_i < 90 } do
    its('entries') { should be_empty }
  end
end
