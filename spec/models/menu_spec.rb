require 'rails_helper'

RSpec.describe Menu, type: :model do
  it 'is valid with a name and a description' do
    menu = Menu.add_menu(
      'Nasi Uduk',
      'Betawi style steamed rice cooked in coconut milk. Delicious!',
      15000.0,
      'Padang'
    )
    expect(menu).to be_valid
  end

  it 'is invalid withou a category' do
    menu = Menu.add_menu(
      'Nasi Uduk',
      'Betawi style steamed rice cooked in coconut milk. Delicious!',
      15000.0,
      nil
    )
    expect(menu).nil?
  end

  it 'is invalid without a name' do
    menu = Menu.add_menu(
      nil,
      'Betawi style steamed rice cooked in coconut milk. Delicious!',
      15000.0,
      'Padang'
    )

    menu.valid?

    expect(menu.errors[:name]).to include("can't be blank")
  end

  it 'is invalid with a duplicate name' do
    menu1 = Menu.add_menu(
      'Nasi',
      'Betawi style steamed rice cooked in coconut milk. Delicious!',
      15000.0,
      'Padang'
    )

    menu2 = Menu.add_menu(
      'Nasi',
      'Betawi style steamed rice cooked in coconut milk. Delicious!',
      15000.0,
      'Padang'
    )
    menu1.valid?
    menu2.valid?

    expect(menu2.errors[:name]).to include('has already been taken')
  end

  it 'is invalid without price less than 0.01' do
    menu = Menu.add_menu(
      "Soto Betawi",
      'Betawi style steamed rice cooked in coconut milk. Delicious!',
      0,
      'Padang'
    )

    menu.valid?

    expect(menu.errors[:price]).to include("must be greater than 0.01")
  end
end