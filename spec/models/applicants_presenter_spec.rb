require 'spec_helper'

describe ApplicantPresenter do
  before(:each) do
    @aopts = {
      :person => {
        :first_name => 'Neo',
        :last_name => 'Anderson',
      },
      :user => {
        :email => 'neo@matrix.com',
        :email_confirmation => 'neo@matrix.com',
        :password => 'password'
      }
    }
    @opts = @aopts.clone
    @applicant = ApplicantPresenter.new(@aopts)
  end

  it "should have a person instance" do
    @applicant.person.should be_kind_of(Person)
  end

  it "should have person.first_name as set by new" do
    @applicant.person.first_name.should == @opts[:person][:first_name]
  end

  it "should have person.last_name as set by new" do
    @applicant.person.last_name.should == @opts[:person][:last_name]
  end

  it "should have user.email as set by new" do
    @applicant.user.email.should == @opts[:user][:email]
  end

  it "should have user.email_confirmation as set by new" do
    @applicant.user.email_confirmation.should == @opts[:user][:email_confirmation]
  end

  it "should return true on save" do
    @applicant.save!.should be_true
  end

  it "should have errors on a false save" do
    @applicant.user.password = nil
    @applicant.save.should be_false
    @applicant.errors.should be_kind_of(Array)
    @applicant.errors.should_not be_blank
  end

  it "should have raise on a false save!" do
    @applicant.user.password = nil
    lambda{ @applicant.save! }.should raise_error(ActiveRecord::RecordInvalid)
  end

end

