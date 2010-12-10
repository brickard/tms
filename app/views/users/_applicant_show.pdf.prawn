prawn_document(:filename => "#{@user.full_name.gsub(/\s+/, '')}", :force_download => true) do |pdf|
  pdf.font_size 10
  pdf.text @user.full_name, :size => 16, :style => :bold, :spacing => 4
  pdf.text @user.skills.map{ |s| s.name }.join(" | "), :size => 12, :style => :bold_italic, :spacing => 4
  pdf.text %w{ home_phone mobile_phone other_phone }.map { |a| "#{a.first.upcase}: #{@user.send(a.to_sym)||'None'}" }.join(" | ") + " | E: #{@user.email}", :style => :bold_italic, :spacing => 4
  pdf.text %w{ address1 address2 location }.map { |a| "#{@user.send(a.to_sym)||'None'}" }.join(" "), :style => :bold_italic, :spacing => 4
  pdf.move_down 4


  pdf.text 'Details', :size => 12, :style => :bold_italic, :spacing => 4
  pdf.move_down 2
  pdf.text "Date of Birth: #{humanize_date(@user.date_of_birth)}"
  pdf.text "Can Start On : #{humanize_date(@user.available_at)}"
  pdf.text "Reliable Vehicle: #{yes_or_no(@user.has_reliable_vehicle)}"
  pdf.text "Can Travel: #{yes_or_no(@user.can_travel_long_term)}"
  pdf.text "Needs Special Hours: #{yes_or_no(@user.needs_special_hours)}"
  pdf.text "Needs Special Hours Details: #{@user.needs_special_hours_detail}"
  pdf.text "Has Been Convicted: #{yes_or_no(@user.been_convicted)}"
  pdf.text "Has Been Convicted Details: #{@user.been_convicted_detail}"
  pdf.text "Applied Before: #{yes_or_no(@user.applied_before)}"
  pdf.text "Applied Before Details: #{@user.applied_before_detail}"
  pdf.text "Ever Failed Drug Test: #{yes_or_no(@user.ever_failed_drug_test)}"
  pdf.text "Legal US Worker: #{yes_or_no(@user.legal_us_worker)}"
  pdf.text "Shirt Order Count: #{@user.shirt_count}"
  pdf.text "Emergency Contact Name: #{@user.emergency_contact_name} | Emergency Contact Phone: #{@user.emergency_contact_phone}"
  pdf.move_down 4

  pdf.text 'Drivers License Information', :size => 12, :style => :bold_italic, :spacing => 4
  pdf.move_down 2
  pdf.text "Valid: #{yes_or_no(@user.drivers_license_valid)}"
  pdf.text "Number: #{@user.drivers_license_number} |  State: #{@user.drivers_license_state}  |  Expires #{humanize_date(@user.drivers_license_expiration)}"
  pdf.text "Ever Suspended: #{yes_or_no(@user.applied_before)}"
  pdf.text "Ever Suspended Details: #{@user.applied_before_detail}"
  pdf.move_down 4


  pdf.text 'Employment History', :size => 12, :style => :bold_italic, :spacing => 4
  pdf.move_down 2
  @user.employers.each do |employer|
    pdf.text "#{employer.company_name} | #{employer.phone_number} | #{humanize_date(employer.start_date)} to #{humanize_date(employer.start_date)}", :style => :bold
    pdf.text "Salary: #{employer.start_salary} to #{employer.end_salary}"
    pdf.text "Title: #{employer.job_title}"
    pdf.text "Supervisor: #{employer.supervisor_name}"
    pdf.text "Reason for leaving: #{employer.reason_for_leaving}"
    pdf.move_down 2
  end
  pdf.move_down 4

  pdf.text 'References', :size => 12, :style => :bold_italic, :spacing => 4
  pdf.move_down 2
  @user.references.each do |reference|
    pdf.text "#{reference.name} | #{reference.contact_info}", :style => :bold
    pdf.text "#{reference.type_of_reference} Relationship: #{reference.relationship}"
    pdf.move_down 2
  end
  pdf.move_down 4

end
