require 'rails_helper'

RSpec.feature "Visitor can add to cart", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99,
        image: open_asset('apparel1.jpg')
      )
    end
  end

  scenario "add first item to cart" do
    # ACT
    visit root_path
    expect(page).to have_content( 'My Cart (0)')
    first('form[action="/cart/add_item?product_id=1"]').click
    expect(page).to have_content( 'My Cart (1)')

    # DEBUG / VERIFY
    page.save_screenshot
  end

end