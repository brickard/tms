# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
@admin_email = 'admin@storeresetter.com'
@admin_password = 'admin_password'
@admin_user = User.create( :email => @admin_email, :password => @admin_password,
                           :password_confirmation => @admin_password )
@admin_user.confirmed_at = Time.now
@admin_user.save!
