# encoding: utf-8
# copyright: 2018, The Authors

title 'Animals'

control 'Check my animals' do
  impact 1.0
  title 'Check my animals'
  describe animal('Alice') do
    it { should exist }
    its('species') { should eq 'Aardvark' }
  end

  describe animal('Barry') do
    it { should_not exist }
  end
end
