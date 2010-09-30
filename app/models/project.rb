class Project < ActiveRecord::Base
  belongs_to :store
  has_many :shifts

  def display_name
    [ store.client.name, store.name, name ].join( ' | ' )
  end
end
