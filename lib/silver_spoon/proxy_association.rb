module SilverSpoon

  class ProxyAssociation

    attr_accessor :items

    delegate :[], :first, :second, :third, :fourth, :fifth, :forty_two,
      :find, :select,
      :last, :take, :count, :size, :length, :empty?, :any?, :many?, :include?,  
      to: :items

    def initialize( model, association )
      @owner = association.owner
      @model = model
      @items = @model.find(:all, foriegn_key(@owner) => @owner.to_param)
    end

    def create(args)
      args[foriegn_key(@owner)] = @owner.to_param
      @model.create(args)
    end

    def create!(args)
      args[foriegn_key(@owner)] = @owner.to_param
      @model.create!(args)
    end

    def build(args)
      args[foriegn_key(@owner)] = @owner.to_param
      @model.build(args)
    end
    alias_method :new, :build

    def concat(new)
      @items.concat(new)
    end

    #def reload
    #end

    #def reset
    #end

    #def reset_scope
    #end

    def foriegn_key(klass); ActiveSupport::Inflector.foreign_key(klass.class.name); end

  end
end
