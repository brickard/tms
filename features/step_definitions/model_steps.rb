Then /^there should be a "([^"]*)" whose "([^"]*)" is "([^"]*)"$/ do |model, attr, val|
  model = eval("#{model.camelize}")
  record = model.send("find_by_#{attr}".to_sym, val)
  record = record.kind_of?(ActiveRecord::Relation) ? record.last : record
  record.send("#{attr}".to_sym).should == val
end

Given /^(a|an|\d+) "([^"]*)"$/ do |count, model|
  count = %w{a an}.include?(count) ? 1 : count.to_i
  model_name = model.underscore.to_sym
  case model_name
    when :applicant
      model = Person
    else
      model = eval("#{model.camelize}")
  end
  count.times do
    instance_variable_set("@#{model_name}".to_sym, Factory(model_name))
    record = instance_variable_get("@#{model_name}".to_sym)
    record.save!.should be_true
    record.should be_kind_of(model)
  end 
end

