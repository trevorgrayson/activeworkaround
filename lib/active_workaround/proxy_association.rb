module ActiveWorkaround

  class ProxyAssociation

    attr_accessor :results

    delegate :[], :first, :second, :third, :fourth, :fifth, :forty_two,
      :find, :select,
      :last, :take, :count, :size, :length, :empty?, :any?, :many?, :include?,  
      to: :results

    def initialize( model, association )
      @owner = association.owner
      @model = model
      @results = @model.find(:all, foriegn_key(@owner) => @owner.to_param)
    end

    def create(args)
      @model.create(args)
    end

    def create!(args)
      @model.create!(args)
    end

    def build(args)
      @model.build(args)
    end

    def concat(new)
      @results.concat(new)
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
