Given /^the last Employee belongs to the last Applicant$/ do
  @applicant = Person.applicants.last
  @applicant.employee = Employee.last
  @applicant.save!.should be_true
end

Given /^the last UniformOrder belongs to the last Applicant$/ do
  @applicant = Person.applicants.last
  @applicant.employee.uniform_order = UniformOrder.last
  @applicant.save!.should be_true
end

Given /^the last (\d+) Employers belongs to the last Applicant$/ do |count|
  @applicant = Person.applicants.last
  Employer.find(:all, :order => :created_at, :limit => count).each do |employer|
    @applicant.employee.employers << employer
  end
  @applicant.save!.should be_true
  @applicant.employee.employers.count.should == count.to_i
end

Given /^the last (\d+) References belongs to the last Applicant$/ do |count|
  @applicant = Person.applicants.last
  Reference.find(:all, :order => :created_at, :limit => count).each do |reference|
    @applicant.employee.references << reference
  end
  @applicant.save!.should be_true
  @applicant.employee.references.count.should == count.to_i
end

