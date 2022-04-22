require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is valid with a name' do
    category = Category.where(
      :name => "Indonesia"
    ).first_or_create!

    expect(category).to be_valid
  end

  it 'is invalid without a name' do
    category = Category.new(name: nil)
    expect(category.valid?).to be false
  end
end
