require 'rails_helper'

RSpec.describe CategoriesController, "#index", type: :controller do
  it "should get index" do
    Category.create(title: 'Work')
    Category.create(title: 'Job')
    get :index
    expect(assigns(:categories).length).to eq(2)
    expect(response).to be_success
  end
end

RSpec.describe CategoriesController, "#index", type: :controller do
  context "Show all categories" do
    it "Should show all categories" do
      Category.create(title: 'Work')
      Category.create(title: 'Job')
      get :index
      expect(assigns(:categories).length).to eq(2)
      expect(response).to be_success
    end
  end
end

RSpec.describe CategoriesController, "#new", type: :controller do
    it "can create a new category?" do
      get :new
      expect(response).to be_success
      expect(assigns(:category)).not_to be_nil
      expect(assigns(:category).class).to eq(Category)
    end
end

RSpec.describe CategoriesController, "#show", type: :controller do
  it "can it show a category?" do
    Category.create(title: 'Work')
    get :show, params: {id: 1}
    expect(response).to be_success
    expect(:category).not_to be_nil
  end
end

RSpec.describe CategoriesController, "#edit", type: :controller do
  it "can edit a category?" do
    Category.create(title: 'Work')
    get :edit, params: {id: 1}
    expect(response).to be_success
    expect(:category).not_to be_nil
  end
end

RSpec.describe CategoriesController, "#update", type: :controller do
  it "can update a category field?" do
    Category.create(title: 'Work')
    patch :update, params: {id:1, category: {title:'Updated'}}
    expect(response).to redirect_to(category_url(1))
    expect(assigns(:category).title).to eq "Updated"
  end
end

RSpec.describe CategoriesController, "#create", type: :controller do
  it "can it create a new category?" do
    Category.create(title: 'Created')
    expect{post :create, params: {id:2, category: {title:'Created'}}}.to change(Category, :count).by(+1)
    expect(response).to redirect_to(category_url(2))
    expect(assigns(:category).title).to eq "Created"
  end
end

RSpec.describe CategoriesController, "#destroy", type: :controller do
  it "can it delete a category?" do
    Category.create(title: 'TestDestroy')
    expect {delete :destroy, params: {id: 1}}.to change(Category, :count).by(-1)

    expect(response).to redirect_to(categories_path)
  end
end
