require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { category = Category.new }

  context "validations" do
    it "checks for presence of name" do
      category.save
      expect(category.errors).to_not be_empty
      expect(category.errors[:name]).to include "is not included in the list"
    end
  end
end
