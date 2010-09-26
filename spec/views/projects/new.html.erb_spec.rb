require 'spec_helper'

describe "projects/new.html.erb" do
  before(:each) do
    assign(:project, stub_model(Project,
      :new_record? => true,
      :store_id => 1,
      :name => "MyString"
    ))
  end

  it "renders new project form" do
    render

    rendered.should have_selector("form", :action => projects_path, :method => "post") do |form|
      form.should have_selector("input#project_store_id", :name => "project[store_id]")
      form.should have_selector("input#project_name", :name => "project[name]")
    end
  end
end
