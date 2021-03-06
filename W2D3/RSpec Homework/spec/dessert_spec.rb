require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  let(:pie) { Dessert.new("pie", 10, chef) }
  describe "#initialize" do
    it "sets a type" do
      expect(pie.type).to eq("pie")
    end

    it "sets a quantity" do
      expect(pie.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(pie.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{ Dessert.new("cake", "big cake", chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      pie.add_ingredient("cream")
      expect(pie.ingredients).to include("cream")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["cream", "strawberry", "chocolate", "mango"]
      ingredients.each { |ing| pie.ingredients << ing }

      expect(pie.ingredients).to eq(ingredients)
      pie.mix!
      expect(pie.ingredients).not_to eq(ingredients)
      expect(pie.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(pie.quantity).to eq(10)
      pie.eat(5)
      expect(pie.quantity).to eq(5)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect(pie.quantity).to eq(10)
      expect{ pie.eat(12) }.to raise_error("not enough left!")
    end

  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize)
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
        allow(chef).to receive(:bake).with("pie")
    end
  end
end
