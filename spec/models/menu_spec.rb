require 'rails_helper'

RSpec.describe Menu, type: :model do
  it 'is valid with a name and a description' do
    menu = Menu.add_menu(
      "Nasi Uduk",
      'Betawi style steamed rice cooked in coconut milk. Delicious!',
      15000.0,
      "Padang"
    )
    expect(menu).to be_valid
  end

  it 'is invalid withou a category' do
    menu = Menu.add_menu(
      "Nasi Uduk",
      'Betawi style steamed rice cooked in coconut milk. Delicious!',
      15000.0,
      nil
    )
    expect(menu).nil?
  end
  # it 'is invalid without a name' do
  #   menu = Menu.new(
  #     name: nil,
  #     description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
  #     price: 15000.0
  #   )
  #
  #   menu.valid?
  #
  #   expect(menu.errors[:name]).to include("can't be blank")
  # end
  #
  # it "is invalid with a duplicate name" do
  #   menu1 = Menu.create(
  #     name: "Nasi Uduk",
  #     description: "Betawi style steamed rice cooked in coconut milk. Delicious!",
  #     price: 10000.0
  #   )
  #
  #   menu2 = Menu.new(
  #     name: "Nasi Uduk",
  #     description: "Just with a different description.",
  #     price: 10000.0
  #   )
  #
  #   menu2.valid?
  #
  #   expect(menu2.errors[:name]).to include("has already been taken")
  # end
end