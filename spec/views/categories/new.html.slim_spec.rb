require 'rails_helper'
require 'spec_helper'

RSpec.describe "categories/new.html.slim", type: :view do
  it 'displays category correctly' do
    assign(:category, Category.new)

    render

    expect(rendered).to match('<h1>New Category</h1>')
    expect(rendered).to have_selector('input[id="category_title"]')
    expect(rendered).to have_selector('a[href="/categories"]', :text => 'Back')
  end
end
