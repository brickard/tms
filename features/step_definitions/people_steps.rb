Given /^I am a person with first name "([^"]*)" and last name "([^"]*)"$/ do |first_name, last_name|
  @person = Person.new( :first_name => first_name, :last_name => last_name,
                        :user => @user)
  @person.save!.should be_true
end

