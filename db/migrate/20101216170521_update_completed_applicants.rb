class UpdateCompletedApplicants < ActiveRecord::Migration
  def self.up
    User.with_role('applicant').each do |applicant|
      if applicant.form_step == 'step6'
        applicant.application_complete = true
        applicant.save!
      end
    end
  end

  def self.down
  end
end
