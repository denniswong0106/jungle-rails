require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do
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

  scenario "They see all products" do
    # ACT
    visit root_path
    first('a[href="/products/1"]').click
    expect(page).to have_css('article[class="product-detail"]')
    expect(page).to have_css('img[class="main-img"]')




    # DEBUG / VERIFY
    page.save_screenshot

  end

end
# <a class="btn btn-default pull-right" href="/products/12">
#       Details »
# </a>