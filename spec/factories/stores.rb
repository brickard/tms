def get_client
  @client ||= Factory.create(:client)
end
def get_manager
  @manager ||= Factory.create(:manager_user)
end

Factory.define :store do |f|
  f.client { get_client }
  f.region { Factory.create(:region, :client => get_client) }
  f.manager { get_manager }
  f.active true
  f.name { Factory.next(:name) }
  f.address1 { Factory.next(:address1) }
  f.address2 { Factory.next(:address2) }
  f.city 'Zion'
  f.zipcode '35216'
end

