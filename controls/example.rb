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

  animals.where(species: 'Crocodile').entries.each do |crocodile|
    describe crocodile do
      its(:weight) { should cmp > 90 }
    end
  end
end
