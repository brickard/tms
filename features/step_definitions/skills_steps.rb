Given /^the default skills exist$/ do
  steps %Q{
    Given a skill exists with name: "Management"
      And a skill exists with name: "Merchandiser"
      And a skill exists with name: "Carpenter"
      And a skill exists with name: "Fixture Installer"
  }
end

