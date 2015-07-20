module ActiveWorkaround

  class CollectionProxy
    attr_accessor :owner, :model, :proxy_association

    def initialize model, association
      @proxy_association = ActiveWorkaround::ProxyAssociation.new(model, association)
    end

    delegate :[], :first, :second, :third, :fourth, :fifth, :forty_two,
      :find, :select,
      :last, :take, :count, :size, :length, :empty?, :any?, :many?, :include?,  
      :create, :create!, :build, :new,
      to: :proxy_association

    #replace, delete_all, destroy_all, delete, destroy, distinct, uniq, 

    def method_missing method, *args
      puts "DEBUGGER: #{method}" + args.inspect
    end

    def concat new
      proxy_association.concat(new)
    end

    def <<(*records)
      records.map {|record| record.save }
      proxy_association.concat(records) && self
    end
    alias_method :push, :<<
    alias_method :append, :<<

    def prepend(*args)
      raise NoMethodError, "prepend on association is not defined. Please use << or append"
    end

    # Equivalent to +delete_all+. The difference is that returns +self+, instead
    # of an array with the deleted objects, so methods can be chained. See
    # +delete_all+ for more information.
    # Note that because +delete_all+ removes records by directly
    # running an SQL query into the database, the +updated_at+ column of
    # the object is not changed.
    def clear
      delete_all
      self
    end

    # Reloads the collection from the database. Returns +self+.
    def reload
      proxy_association.reload
      self
    end

    # Unloads the association. Returns +self+.
    def reset
      proxy_association.reset
      proxy_association.reset_scope
      self
    end

  end
end
