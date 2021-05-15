class Coffee
  def ingredients
    @ingredients ||= []
  end

  def add(ingredient)
    ingredients << ingredient
  end

  def price
    #1.00 # one test passing
    1.00 + ingredients.size * 0.25 # two test passing
  end

  def color
    ingredients.include?(:milk) ? :light : :dark
  end

  def temperature
    ingredients.include?(:milk) ? 190.0 : 205.0
  end

  def inspect
    self.class.name + "(with #{@ingredients.join(",")})"
  end
end

RSpec.describe 'A cup of coffee' do
  let(:coffee) { Coffee.new }
  
  it 'cost $1' do
    expect(coffee.price).to eq(1.00)
  end

  context 'with milk', focus: true do
    before {  coffee.add :milk }

    it 'cost $1.25' do
      expect(coffee.price).to eq(1.25)
    end


    # Marking work in progress (Pending)
    # completing work in progress(implementing methods)
    # use of skip for not to run or
    # use of xit annotation that skips the example
    
    xit 'is light in color' do
    #it 'is light in color' do
      # pending 'Color not implemented yet'
      # skip 'Color not implemented yet'
      expect(coffee.color).to be(:light)
      end

    xit 'is cooler than 200 degrees Fahrenheit' do
    #it 'is cooler than 200 degrees Fahrenheit' do
      # pending 'Temperature not implemented yet'
      # skip 'Temperature not implemented yet'
      expect(coffee.temperature).to be < 200.0
    end
  end
end
