# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :discipline do |f|
  f.name "Sleeping on the job"
  f.occured_on "2011-01-22"
  f.store { Factory.create(:store) }
  f.verbal_warning_on "2011-01-22"
  f.verbal_warning_subject "Sleeping on the job 3 times."
  f.verbal_warning_reason "Sleeping on the job again!!"
  f.verbal_warning_action "Fired again"
  f.possible_termination_on "2011-01-22"
  f.supervisor { Factory.create(:manager_id) }
end
