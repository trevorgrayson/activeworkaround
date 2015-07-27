#presume it's an active record compliant object,
# abstract
module ActiveWorkaround
  module PoroConcern #extend ActiveSupport::Concern

    def has_many(name, args={})
      @@active_workaround_args ||= {}
      @@active_workaround_args[:has_many] ||= {}
      @@active_workaround_args[:has_many][name] = args
      @@active_workaround_args[:has_many][name][:_attribute_name] = name

      define_method(name) do
        #return instance_variable_get(name) if does_cache && !instance_variable_get(name).nil?

        args= @@active_workaround_args[:has_many][name]
        msg = {}

        foreign_key = args[:foreign_key] || ActiveSupport::Inflector.foreign_key(self.class.name)
        msg[foreign_key] = respond_to?(:to_param) ? to_param : @id

        klass_title = ActiveSupport::Inflector.classify( msg[:class_name] || name )
        klass = args[:class] || ActiveSupport::Inflector.constantize(klass_title)

        response = klass.find(:all, msg)
        #instance_variable_set(name, response) if does_cache
        response
      end
    end

    def belongs_to(name, args={})
      @@active_workaround_args ||= {}
      @@active_workaround_args[:belongs_to] ||= {}
      @@active_workaround_args[:belongs_to][name] = args
      @@active_workaround_args[:belongs_to][name][:_attribute_name] = name

      define_method(name) do

        args= @@active_workaround_args[:belongs_to][name]
        msg = {}

        foreign_key = args[:foreign_key] || :id
        msg[foreign_key] = respond_to?(:to_param) ? to_param : @id

        klass_title = ActiveSupport::Inflector.classify(name)
        klass = args[:class] || ActiveSupport::Inflector.constantize(klass_title)

        klass.find(msg)
      end
    end

  end
end
