class Tea
  def flavor
    :earl_grey
  end

  def temperature
    205.0
  end

end

RSpec.configure do |config|
  config.example_status_persistence_file_path = "spec/examples.txt"
end

# Use of rspec -fh -o test_results.html
# Use of rspec -fj -o test_results.json

RSpec.describe Tea do
  let(:tea) { Tea.new }
  
  it 'tastes like Earl Grey' do
    expect(tea.flavor).to be :earl_grey
  end

  it 'is hot' do
    expect(tea.temperature).to be > 200.0
  end
end
