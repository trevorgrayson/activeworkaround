# SilverSpoon
In this world there are the has, and the has nots.  ActiveRecord can `has_many` other ActiveRecords, but what about the rest of us? SilverSpoon lets ActiveRecord objects `has_many` Non-ActiveRecord objects, or for Non-ActiveRecord objects to `has_many` Non-ActiveRecord objects.  

For the people!

## Suppose you have a plain old ActiveModel

    class BankAccount
      class << self
        def find(args)
          HTTP Request...
          an arbitrary service...
          or some awful local Modeling logic...
          ...
        end
      end
    end

## And another Object that bares an association to it

    class User < ActiveRecord::Base
      extend SilverSpoon::ActiveConcern

      has_many :bank_accounts
    end

## Now make calls a la ActiveRecord Association

    user = User.new

    user.bank_accounts

The referencing class does not have to be an ActiveRecord object.  It simply needs to respond to a `find` method as you would expect. Having an `@id` or `to_params` would be useful as well in most cases.  It would also be nice if there was a `save` method, if you're going to be doing something like that.

The `find` method may receive the id from the referring object to associate the two.

