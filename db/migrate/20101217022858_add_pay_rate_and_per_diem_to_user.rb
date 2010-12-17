class AddPayRateAndPerDiemToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :pay_rate, :integer, :default => 0
    add_column :users, :per_diem, :integer, :default => 0
  end

  def self.down
    remove_column :users, :per_diem
    remove_column :users, :pay_rate
  end
end
