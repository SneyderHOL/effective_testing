class Coffee
  def ingredients
    @ingredients ||= []
  end

  def add(ingredient)
    ingredients << ingredient
  end

  def price
    1.00 # one test passing
    # 1.00 + ingredients.size * 0.25 # two test passing
  end
end

# focusing specific examples
RSpec.configure do |config|
  config.filter_run_when_matching(focus: true)
end

RSpec.describe 'A cup of coffee' do
  let(:coffee) { Coffee.new }
  
  it 'cost $1' do
    expect(coffee.price).to eq(1.00)
  end

  # (using focus tag)
  # context '', focus: true do...
  # hash like the above line is known as metadata (use of tags)
  # filter example like: rspec --tag last_run_status:failed
  context 'with milk', focus: true do
    before {  coffee.add :milk }

    it 'cost $1.25' do
      expect(coffee.price).to eq(1.25)
    end
  end
end
