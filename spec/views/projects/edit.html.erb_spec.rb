require 'spec_helper'

describe "projects/edit.html.erb" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :new_record? => false,
      :store_id => 1,
      :name => "MyString"
    ))
  end

  it "renders the edit project form" do
    render

    rendered.should have_selector("form", :action => project_path(@project), :method => "post") do |form|
      form.should have_selector("input#project_store_id", :name => "project[store_id]")
      form.should have_selector("input#project_name", :name => "project[name]")
    end
  end
end
