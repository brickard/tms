class Expense < ActiveRecord::Base
  belongs_to :employee, :class_name => 'User'
  validate :employee_id, :submitted_at, :amount, :presence => :true
  composed_of :amount, 
    :class_name => "Money", :mapping => %w(amount cents), 
    :converter => Proc.new { |amount| amount.respond_to?(:to_money) ? 
                                        amount.to_money : Money.empty },
    :constructor => Proc.new { |amount| Money.new(amount||0, Money.default_currency) }

end
