#presume it's an active record compliant object,
# abstract
module SilverSpoon
  module Concern #extend ActiveSupport::Concern

    class << self
      def self.relation_delegate_class(_args)
        SilverSpoon::CollectionProxy
      end
    end

  end
end
