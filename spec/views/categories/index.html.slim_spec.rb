require 'rails_helper'
require 'spec_helper'

RSpec.describe "categories/index.html.slim", type: :view do
  it 'displays categories correctly' do
    assign(:categories, [Category.create(title: 'Work', created_at: DateTime.now, updated_at: DateTime.now)])

    render

    expect(rendered).to match('<h1>Categories List</h1>')
    expect(rendered).to have_selector('a[href="/categories/new"]', :text => 'New Category')
    expect(rendered).to match('<table>')
    expect(rendered).to match('<tr>')
    expect(rendered).to match('<th>Category</th>')
    expect(rendered).to match('<td>Work</td>')
    expect(rendered).to have_selector('a[href="/categories/1"]', :text => 'Show')
    expect(rendered).to have_selector('a[href="/categories/1/edit"]', :text => 'Edit')
    expect(rendered).to have_selector('a[href="/categories/1"]', :text => 'Destroy')
    expect(rendered).to match('</tr>')
    expect(rendered).to match('</table>')
    expect(rendered).to have_selector('a[href="/items"]', :text => 'Back')
  end
end
