class Test
  include Mongoid::Document
  include Mongoid::Timestamps
  field :testName, type: String
  field :targetUrl, type: String
end
