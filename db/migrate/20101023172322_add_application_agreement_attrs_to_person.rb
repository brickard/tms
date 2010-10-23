class AddApplicationAgreementAttrsToPerson < ActiveRecord::Migration
  def self.up
    add_column :people, :application_agreement_agreed, :boolean
    add_column :people, :application_agreement_agreed_on, :date
  end

  def self.down
    remove_column :people, :application_agreement_agreed_on
    remove_column :people, :application_agreement_agreed
  end
end
