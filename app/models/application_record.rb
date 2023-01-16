class ApplicationRecord 
  include Mongoid::Document
  self.abstract_class = true
end
