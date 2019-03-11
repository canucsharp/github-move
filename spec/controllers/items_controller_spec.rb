require 'rails_helper'

RSpec.describe ItemsController, "#index", type: :controller do
  it "should get index" do
    Item.create(title: 'Work')
    Item.create(title: 'Job')
    get :index
    expect(assigns(:items).length).to eq(2)
    expect(response).to be_success
  end
end

RSpec.describe ItemsController, "#index", type: :controller do
  context "Show all Item" do
    it "Should show all Item" do
      Item.create(title: 'Work')
      Item.create(title: 'Job')
      get :index
      expect(assigns(:items).length).to eq(2)
      expect(response).to be_success
    end
  end
end

RSpec.describe ItemsController, "#new", type: :controller do
    it "can create a new Item?" do
      get :new
      expect(response).to be_success
      expect(assigns(:item)).not_to be_nil
      expect(assigns(:item).class).to eq(Item)
    end
end

RSpec.describe ItemsController, "#show", type: :controller do
  it "can it show a Item?" do
    Item.create(title: 'Work')
    get :show, params: {id: 1}
    expect(response).to be_success
    expect(:item).not_to be_nil
  end
end

RSpec.describe ItemsController, "#edit", type: :controller do
  it "can edit a Item?" do
    Item.create(title: 'Work')
    get :edit, params: {id: 1}
    expect(response).to be_success
    expect(:item).not_to be_nil
  end
end

RSpec.describe ItemsController, "#update", type: :controller do
  it "can update a Item field?" do
    Item.create(title: 'Work')
    patch :update, params: {id:1, item: {title:'Updated'}}
    expect(response).to redirect_to(item_url(1))
    expect(assigns(:item).title).to eq "Updated"
  end
end

RSpec.describe ItemsController, "#create", type: :controller do
  it "can it create a new Item?" do
    Item.create(title: 'Created')
    expect{post :create, params: {id:2, category: {title:'Created'}}}.to change(Item, :count).by(+1)
    expect(response).to redirect_to(item_url(2))
    expect(assigns(:item).title).to eq "Created"
  end
end

RSpec.describe ItemsController, "#destroy", type: :controller do
  it "can it delete a Item?" do
    Item.create(title: 'TestDestroy')
    expect {delete :destroy, params: {id: 1}}.to change(Item, :count).by(-1)

    expect(response).to redirect_to(items_path)
  end
end
