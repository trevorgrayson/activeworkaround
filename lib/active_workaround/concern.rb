#presume it's an active record compliant object,
# abstract
module ActiveWorkaround
  module Concern #extend ActiveSupport::Concern

    class << self
      def self.relation_delegate_class(_args)
        ActiveWorkaround::CollectionProxy
      end
    end

  end
end
