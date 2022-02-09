require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They can get to product details from root by clicking on the product" do
    # ACT
    visit root_path

    #check for all products
    expect(page).to have_css 'article.product',count: 10

    save_screenshot('Product_home_page.png')

    #click on detail button
    first('.btn-default').click

    #check of the page changed
    expect(page).to have_content('Quantity')

    # DEBUG / VERIFY
    save_screenshot('Product_page.png')

  end

end
