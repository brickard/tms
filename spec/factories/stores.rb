Factory.define :store do |f|
  @client = lambda{ Factory.create(:client) }
  @manager = lambda{ User.store_managers.last || Factory.create(:user, :roles => [ 
    Factory.create(:manager_role),
  ]) }
  f.client @client 
  f.region { Factory.create(:region, :client => @client) }
  f.manager @manager
  f.active true
  f.name { Factory.next(:name) }
  f.address1 { Factory.next(:address1) }
  f.address2 { Factory.next(:address2) }
  f.city 'Zion'
  f.zipcode '35216'
end

