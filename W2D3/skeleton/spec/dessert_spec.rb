require 'rspec'
require 'dessert'
require "chef"

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:cake) { Dessert.new("cake", 10, Chef.new("Laura") ) }

  describe "#initialize" do
    it "sets a type" do
      expect(cake.type).to eq("cake")
    end

    it "sets a quantity" do
      expect(cake.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(cake.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "ten", "Laura") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(cake.ingredients).to_not include('eggs')
      cake.add_ingredient("eggs")
      expect(cake.ingredients).to include('eggs')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ings = ['eggs', "milk", 'flour', "bears", 'honey']
      cake.add_ingredient("eggs")
      cake.add_ingredient("milk")
      cake.add_ingredient("flour")
      cake.add_ingredient("bears")
      cake.add_ingredient("honey")
      expect(cake.ingredients).to eq(ings)
      # expect(cake).to receive(:mix!)
      cake.mix!
      expect(cake.ingredients).to_not eq(ings)
      expect(cake.ingredients.sort).to eq(ings.sort)

    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cake.eat(1)
      expect(cake.quantity).to eq(9)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { cake.eat(100) }.to raise_error(RuntimeError)
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(cake.serve).to include("Chef Laura the Great Baker")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(cake.chef).to receive(:bake).with(cake)
      cake.make_more
    end
  end
end
