# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :evaluation do |f|
  f.employee { Factory.create(:employee_user) }
  f.manager { Factory.create(:manager_user) }
  f.attitude 10
  f.work_ethic 10
  f.communication 10
  f.abilities 10
  f.team_work 10
  f.appearance 10
  f.professionalism 10
  f.preparedness 10
  f.organization 10
  f.goals 10
  f.manager_comments "MyText"
  f.employee_comments "MyText"
end
