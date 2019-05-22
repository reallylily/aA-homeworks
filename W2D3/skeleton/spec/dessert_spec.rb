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
    it "shuffles the ingredient array" 
    # do
    #   array = cake.ingredients
    #   expect(array).not_to receive(:shuffle!)
    # end
    # do
    #   cake.add_ingredient("eggs")
    #   cake.add_ingredient("milk")
    #   cake.add_ingredient("flour")
    #   expect(cake).to receive(:shuffle!)
    # end
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
      # allow(chef).to receive(:name).and_return("Laura")
      # allow(chef).to receive(:titleize).and_return("Chef #{@name} the Great Baker")
      expect(cake.serve).to include("Chef Laura the Great Baker")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
      # allow(chef).to receive(:bake).and_return("Laura")
      # expect(cake.chef).to receive(:bake)
  end
end
