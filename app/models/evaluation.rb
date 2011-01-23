class Evaluation < ActiveRecord::Base
  RATINGS = (1..10).to_a.reverse
  belongs_to :employee, :class_name => 'User'
  belongs_to :manager, :class_name => 'User'
  validate :employee_id, :manager_id, :presence => true
  validate :attitude, :work_ethic, :communication, :abilities, :team_work,
           :appearance, :professionalism, :preparedness, :organization,
           :goals, :presence => true, :inclusion => { :in => RATINGS }

  def evaluation_options
    [ attitude, work_ethic, communication, abilities, team_work,
      appearance, professionalism, preparedness, organization, ]
  end

  def score
    evaluation_options.inject(0) do |total, opt|
      total += opt
      total
    end
  end
end
