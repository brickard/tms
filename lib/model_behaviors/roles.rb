module ModelBehaviors

  module RolesBehavior
    
    ROLES = %w{ admin manager employee applicant }
    def self.included( base )
      base.validates :role, :presence => true, :inclusion => { :in => ROLES }
    end

    def role?(role_name)
      self.role == role_name
    end

    ROLES.each do |role_name|
      define_method "#{role_name}?" do
        self.role?(role_name)
      end
    end

  end

end

