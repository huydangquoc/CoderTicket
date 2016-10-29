module CategoryHelpers

  def self.get_or_create(category_name = "Entertainment")
    category = Category.find_by name: category_name
    if !category
      category = FactoryGirl.create(:category, name: category_name)
    end
    return category
  end

end

RSpec.configure do |config|
  config.include CategoryHelpers
end
