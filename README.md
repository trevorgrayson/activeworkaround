# ActiveWorkaround
ActiveModel Association.  "has_many" to any object that responds to ActiveModel methods

## Suppose you have a plain old ActiveModel

    class Comment
      def find(args)
        HTTP Request...
        an arbitrary service...
        or some awful local Modeling logic...
        ...
      end
    end

## And another Object that bares an association to it

    class User < ActiveRecord::Base
      extend ActiveWorkaround::Concern

      #changing this
      has_many_remote :comments
      belongs_to_remote :organization
    end

## Now make calls a la ActiveRecord Association

    user = User.new

    user.comments

The referencing class does not have to be an ActiveRecord object.  It simply needs to respond to a `find` method as you would expect. Having an `@id` or `to_params` would be useful as well in most cases.  

The `find` method may receive the id from the referring object to associate the two.

