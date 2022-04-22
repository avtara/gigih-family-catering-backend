class Menu < ApplicationRecord
  belongs_to :category

  def self.add_menu(name,description,price,category)
    category = Category.where(:name => category).first_or_create!
    Menu.new(
      name: name,
      description: description,
      price: price,
      category: category
    )
  end
end
