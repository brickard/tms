module Carmen
  US_STATES =  [ [ '--Select--', nil ], ] + 
    self.states('US').delete_if do |name, code| 
      %w{ FM GU MH MP PW PR VI AA AE AP }.include?(code)
  end
end
