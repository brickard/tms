class CreateUniformOrders < ActiveRecord::Migration
  def self.up
    create_table :uniform_orders do |t|
      t.integer :user_id
      t.string :shirt_size
      t.integer :shirt_count
      t.string :hat_size
      t.integer :hat_count

      t.timestamps
    end
  end

  def self.down
    drop_table :uniform_orders
  end
end
