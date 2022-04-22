class Menu < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, :numericality => {:greater_than => 0.01}
  belongs_to :category

  def self.add_menu(name,description,price,category)
    if category.nil?
      return
    end
    cat = Category.where(:name => category).first_or_create!
    Menu.create(
      name: name,
      description: description,
      price: price,
      category: cat
    )
  end
end
