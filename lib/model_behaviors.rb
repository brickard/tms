module ModelBehaviors

end

Dir[Rails.root.join("lib/model_behaviors/*.rb")].each {|f| require f}
