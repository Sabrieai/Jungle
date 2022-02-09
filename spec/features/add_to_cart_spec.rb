require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
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

  scenario "They can add a product to their cart" do
    # ACT
    visit root_path

    #check for all products
    expect(page).to have_css 'article.product',count: 10

    #click on add button
    first('.btn-primary').click

    #check of the page changed
    expect(page).to have_content('My Cart (1)')

    # DEBUG / VERIFY
    save_screenshot('Product_added.png')
  end
end
