filename = @shifts.count == 1 ? 
  "#{@shifts.first.display_name.gsub(/[\W]/, '')}" :
  "ListOfEmployeesByShift"
prawn_document(:filename => filename, :force_download => true) do |pdf|
  @shifts.each do |shift|
    pdf.font_size 10
    pdf.text shift.display_name, :size => 16, :style => :bold, :spacing => 4
    pdf.move_down 4

    shift.employees.each do |e|
      pdf.text e.full_name, :size => 12, :style => :bold_italic, :spacing => 4
      pdf.text e.display_phones, :style => :bold, :spacing => 4
      pdf.move_down 4
    end
    pdf.move_down 4
  end
end
