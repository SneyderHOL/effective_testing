class Coffee
  def ingredients
    @ingredients ||= []
  end

  def add(ingredient)
    ingredients << ingredient
  end

  def price
    # 1.00 # one test passing
    1.00 + ingredients.size * 0.25 # two test passing
  end
end

# --only-failures flag
# focusing specific examples
RSpec.configure do |config|
  config.filter_run_when_matching(focus: true)
  config.example_status_persistence_file_path = 'spec/examples.txt'
end

RSpec.describe 'A cup of coffee' do
  let(:coffee) { Coffee.new }
  
  it 'cost $1' do
    expect(coffee.price).to eq(1.00)
  end

  # fcontext shorthanded for context '', focus: true do...
  fcontext 'with milk' do
    before {  coffee.add :milk }

    it 'cost $1.25' do
      expect(coffee.price).to eq(1.25)
    end
  end
end
